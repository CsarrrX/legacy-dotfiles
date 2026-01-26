-- Tecla líder: 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Atajos para búsqueda de archivos y texto general TELESCOPE 
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = "Buscar Archivos" })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = "Grep general" })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = "Buffers abiertos" })

-- ATAJOS PARA INKSCAPE FIGURES 
-- Mapeo para modo Insertar: Crear figura
vim.keymap.set('i', '<C-f>', function()
  -- Salimos de modo insertar
  vim.cmd('stopinsert')
  
  -- Obtenemos la línea actual y la ruta de figuras de VimTeX
  local line = vim.fn.getline('.')
  local fig_path = vim.b.vimtex.root .. '/figures/'
  
  -- Ejecutamos el comando de creación
  -- El '.!' reemplaza la línea actual con el bloque LaTeX que devuelve el script
  vim.cmd('silent exec ".!inkscape-figures create \'" .. line .. "\' \'" .. fig_path .. "\' "')
  
  -- Guardamos el archivo
  vim.cmd('w')
end, { desc = "Crear figura de Inkscape desde línea actual" })

-- Mapeo para modo Normal: Editar figura
vim.keymap.set('n', '<C-f>', function()
  local fig_path = vim.b.vimtex.root .. '/figures/'
  
  -- Ejecutamos el comando de edición en segundo plano
  local cmd = 'silent exec "!inkscape-figures edit \'" .. fig_path .. "\' > /dev/null 2>&1 &"'
  vim.cmd(cmd)
  
  -- Redibujamos la pantalla para limpiar posibles artefactos de la terminal
  vim.cmd('redraw!')
end, { desc = "Seleccionar y editar figura de Inkscape" })
