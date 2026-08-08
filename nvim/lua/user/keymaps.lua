-- TECLA LIDER --
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set
-- FIN DE TECLA LIDER --

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
