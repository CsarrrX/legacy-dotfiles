-- Tecla líder: 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Atajos para búsqueda de archivos y texto general TELESCOPE 
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = "Buscar Archivos" })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = "Grep general" })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = "Buffers abiertos" })

-- ATAJOS PARA INKSCAPE FIGURES 
-- Mapeo para modo Insertar: Crear figura con PROMPT de título
vim.keymap.set('i', '<C-f>', function()
  -- 1. Pedir el título al usuario
  local title = vim.fn.input('Título de la figura: ')
  
  -- Si el usuario cancela (Esc) o deja vacío, no hacemos nada
  if title == "" then 
    print(" Creación cancelada")
    return 
  end

  -- 2. Salimos de modo insertar
  vim.cmd('stopinsert')
  
  -- 3. Verificación de VimTeX
  if not vim.b.vimtex or not vim.b.vimtex.root then
    print("Error: VimTeX no detectado")
    return
  end

  local fig_path = vim.b.vimtex.root .. '/figures/'
  
  -- 4. Construimos el comando con el título que ingresamos en el input
  local cmd = string.format("inkscape-figures create '%s' '%s'", title, fig_path)
  
  -- 5. Ejecutamos y capturamos la salida para insertar el bloque LaTeX
  -- Usamos 'r !' para insertar el resultado del comando en el buffer
  vim.cmd('r !' .. cmd)
  
  -- 6. Limpieza y guardado
  vim.cmd('w')
  vim.cmd('redraw!')
end, { desc = "Crear figura de Inkscape con título personalizado" })

-- Mapeo para modo Normal: Editar figura existente
vim.keymap.set('n', '<C-f>', function()
  -- 1. Verificación de VimTeX (igual que en tu script de creación)
  if not vim.b.vimtex or not vim.b.vimtex.root then
    print("Error: VimTeX no detectado")
    return
  end

  local fig_path = vim.b.vimtex.root .. '/figures/'
  
  -- 2. Construimos el comando de edición
  -- Usamos '&' al final para que se ejecute en segundo plano y no bloquee Neovim
  -- Redirigimos la salida a /dev/null para que no ensucie la pantalla
  local cmd = string.format("inkscape-figures edit '%s' > /dev/null 2>&1 &", fig_path)
  
  -- 3. Ejecutamos el comando
  os.execute(cmd)
  
  -- 4. Redibujamos la pantalla para limpiar cualquier artefacto visual
  vim.cmd('redraw!')
end, { desc = "Editar figura de Inkscape existente" })
