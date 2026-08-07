-- TECLA LIDER --
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set
-- FIN DE TECLA LIDER --

-- FIGURAS RÁPIDAS --
vim.keymap.set('n', '<leader>qf', function()
    local fig_name = vim.fn.input('Nombre de figura: ')
    if fig_name == '' then return end

    -- Obtener las rutas
    local doc_dir = vim.fn.expand('%:p:h')
    local script_path = vim.fn.expand('~/legacy-dotfiles/scripts/draw_fig.sh') 
    -- Ejecutar el script de Bash en segundo plano
    vim.fn.jobstart({script_path, fig_name, doc_dir}, {
        on_exit = function()
            local snippet = string.format(
                "\\begin{figure}[htpb]\n    \\centering\n    \\includegraphics[width=0.8\\textwidth]{figures/%s.pdf}\n\\end{figure}\n",
                fig_name
            )
            
            local pos = vim.api.nvim_win_get_cursor(0)
            local row = pos[1]
            local lines = vim.split(snippet, '\n')
            vim.api.nvim_buf_set_lines(0, row, row, false, lines)
            
            print("\nFigura '" .. fig_name .. "' importada con éxito.")
        end
    })
end, { desc = "Dibujo rápido y auto-importar a LaTeX" })
-- FIN DE FIGURAS RÁPIDAS --

-- FIGURAS INKSCAPE --
local function get_vimtex_root()
  return vim.b.vimtex and vim.b.vimtex.root or "."
end

-- Modo Insertar (<C-f>): Crear figura
vim.keymap.set('i', '<C-f>', function()
  local root = get_vimtex_root()
  local line = vim.fn.getline('.')
  
  return string.format(
    '<Esc>:silent exec \'.!inkscape-figures create "%s" "%s/figures/"\'<CR><CR>:w<CR>',
    line,
    root
  )
end, { expr = true, silent = true, desc = "Crear figura con Inkscape" })

-- Modo Normal (<C-f>): Editar figura
vim.keymap.set('n', '<C-f>', function()
  local root = get_vimtex_root()
  
  local cmd = string.format('inkscape-figures edit "%s/figures/"', root)
  vim.fn.jobstart(cmd)
  
end, { silent = true, desc = "Editar figura con Inkscape en segundo plano" })
-- FIN DE FIGURAS INKSCAPE -- 
