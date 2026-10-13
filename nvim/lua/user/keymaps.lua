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

-- COMPILACIÓN EN C++ --
map("n", "<F5>", function()
  vim.cmd("w") -- Guardar el archivo actual

  local file = vim.fn.expand("%")
  local out = vim.fn.expand("%:r")

  -- Crear input.txt y output.txt en la carpeta actual si no existen
  if vim.fn.filereadable("input.txt") == 0 then
    vim.fn.writefile({}, "input.txt")
  end
  if vim.fn.filereadable("output.txt") == 0 then
    vim.fn.writefile({}, "output.txt")
  end

  -- Comando de compilación C++20 con banderas de advertencia y ejecución
  local compile_run = string.format("g++ -O3 -std=c++20 -Wall %s -o %s && ./%s", file, out, out)

  -- Si ya hay un terminal abierto en un split derecho, usar ese mismo buffer
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_win_close(win, true)
    end
  end

  -- Crear split vertical a la extrema derecha
  vim.cmd("vsplit")
  vim.cmd("wincmd L")
  vim.cmd("vertical resize 55")
  vim.cmd("terminal " .. compile_run)
  vim.cmd("startinsert")
end, { desc = "Compilar y ejecutar C++ en split derecho" })

-- Navegación rápida y salida del modo terminal
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Salir de modo terminal a modo Normal" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Moverse a la ventana izquierda desde terminal" })
-- FIN DE COMPILACIÓN EN C++ --
