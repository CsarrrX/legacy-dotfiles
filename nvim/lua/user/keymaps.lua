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
  -- Obtenemos el título de la línea actual antes de salir de modo insertar
  local line = vim.fn.getline('.')
  
  -- Salimos de modo insertar
  vim.cmd('stopinsert')
  
  -- Verificación de seguridad para VimTeX
  if not vim.b.vimtex or not vim.b.vimtex.root then
    print("Error: VimTeX no detectado o raíz no encontrada")
    return
  end

  local fig_path = vim.b.vimtex.root .. '/figures/'
  
  -- Construimos el comando en Lua primero para evitar errores de variables indefinidas
  -- Usamos string.format para manejar las comillas de forma segura
  local cmd = string.format(".!inkscape-figures create '%s' '%s'", line:gsub("^%s*", ""), fig_path)
  
  -- Ejecutamos el comando
  vim.cmd('silent ' .. cmd)
  
  -- Guardamos y redibujamos
  vim.cmd('w')
  vim.cmd('redraw!')
end, { desc = "Crear figura de Inkscape desde línea actual" })

-- Mapeo para modo Normal: Editar figura
vim.keymap.set('n', '<C-f>', function()
  if not vim.b.vimtex or not vim.b.vimtex.root then
    print("Error: VimTeX no detectado")
    return
  end

  local fig_path = vim.b.vimtex.root .. '/figures/'
  
  -- Para Wayland (Sway), es mejor usar una ejecución directa que no bloquee
  -- Usamos 'edit' con el path que configuramos para Wofi en tu picker.py
  local cmd = string.format("silent !inkscape-figures edit '%s' &", fig_path)
  
  vim.cmd(cmd)
  vim.cmd('redraw!')
end, { desc = "Seleccionar y editar figura de Inkscape" })
