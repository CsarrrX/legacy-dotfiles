-- Tecla líder: 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Figuras rápidas

vim.keymap.set('n', '<leader>df', function()
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
