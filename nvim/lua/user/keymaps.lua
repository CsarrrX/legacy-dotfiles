-- Tecla líder: 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Figuras rápidas

vim.keymap.set('n', '<leader>qf', function()
    local fig_name = vim.fn.input('Nombre de figura: ')
    if fig_name == '' then return end

    -- 2. Obtener las rutas
    local doc_dir = vim.fn.expand('%:p:h')
    local script_path = vim.fn.expand('~/legacy-dotfiles/scripts/draw_fig.sh') -- Ajusta si lo guardaste en otro lado

    -- 3. Ejecutar el script de Bash en segundo plano
    vim.fn.jobstart({script_path, fig_name, doc_dir}, {
        on_exit = function()
            -- 4. Cuando cierras Xournal++, se inserta este bloque de LaTeX
            local snippet = string.format(
                "\\begin{figure}[htpb]\n    \\centering\n    \\includegraphics[width=0.8\\textwidth]{figures/%s.pdf}\n\\end{figure}\n",
                fig_name
            )
            
            -- Insertar el texto debajo del cursor
            local pos = vim.api.nvim_win_get_cursor(0)
            local row = pos[1]
            local lines = vim.split(snippet, '\n')
            vim.api.nvim_buf_set_lines(0, row, row, false, lines)
            
            print("\nFigura '" .. fig_name .. "' importada con éxito.")
        end
    })
end, { desc = "Dibujo rápido y auto-importar a LaTeX" })


-- Figuras inkscape
local function get_vimtex_root()
  return vim.b.vimtex and vim.b.vimtex.root or "."
end

-- 1. Modo Insertar (<C-f>): Crear figura
vim.keymap.set('i', '<C-f>', function()
  local root = get_vimtex_root()
  local line = vim.fn.getline('.')
  
  -- Construimos el comando exacto. Al usar expr = true, Neovim 
  -- interpretará este string devuelto como las teclas que debe presionar.
  return string.format(
    '<Esc>:silent exec \'.!inkscape-figures create "%s" "%s/figures/"\'<CR><CR>:w<CR>',
    line,
    root
  )
end, { expr = true, silent = true, desc = "Crear figura con Inkscape" })

-- 2. Modo Normal (<C-f>): Editar figura
vim.keymap.set('n', '<C-f>', function()
  local root = get_vimtex_root()
  
  -- En Neovim moderno, `jobstart` ejecuta procesos asíncronos en segundo plano 
  -- nativamente, sin bloquear la UI ni requerir :redraw!
  local cmd = string.format('inkscape-figures edit "%s/figures/"', root)
  vim.fn.jobstart(cmd)
  
end, { silent = true, desc = "Editar figura con Inkscape en segundo plano" })

