-- Tecla líder: 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Guardar con <Espacio> + w
keymap("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
-- En lua/user/keymaps.lua
-- Atajos para búsqueda de archivos y texto general
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = "Buscar Archivos" })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = "Grep general" })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = "Buffers abiertos" })

-- Buscador especializado para tus notas de Análisis
-- Encuentra Proposiciones, Definiciones, Teoremas, Lemas y Axiomas
vim.keymap.set('n', '<leader>n', function()
  require('telescope.builtin').live_grep({
    prompt_title = "📚 Buscador de Teoremas (Análisis)",
    -- Patrón automático para tus entornos
    default_text = "\\\\begin{(proposicion|definicion|teorema|lema|axioma)}",
    -- Argumentos adicionales para Ripgrep
    additional_args = function()
      return {
        "--pcre2",      -- Permite usar el formato (a|b|c)
        "-g", "*.tex",  -- Solo busca en archivos .tex
      }
    end,
  })
end, { desc = "Buscar definiciones en notas de clase" })
