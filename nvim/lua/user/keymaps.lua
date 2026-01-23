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

-- COMENTAR DESPUES 
-- Función auxiliar para ejecutar el comando de inkscape-figures
local function create_figure()
  local name = vim.fn.input("Nombre de la figura: ")
  if name == "" then return end
  
  -- Obtiene la ruta del directorio del archivo actual
  local root = vim.fn.expand('%:p:h')
  local figures_path = root .. "/figures/"
  
  -- Crea la carpeta si no existe
  os.execute("mkdir -p " .. figures_path)
  
  -- Ejecuta el comando de Giles
  vim.cmd(string.format("silent !inkscape-figures create '%s' '%s'", name, figures_path))
end

-- Mapeos
-- Modo Insertar: Ctrl+f para crear
vim.keymap.set('i', '<C-f>', create_figure, { desc = "Crear figura con Inkscape" })

-- Modo Normal: Ctrl+f para editar figuras existentes
vim.keymap.set('n', '<C-f>', function()
  local root = vim.fn.expand('%:p:h')
  vim.cmd(string.format("silent !inkscape-figures edit '%s/figures/'", root))
end, { desc = "Editar figuras de Inkscape" })
