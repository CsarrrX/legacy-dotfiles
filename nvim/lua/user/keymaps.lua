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
local TERMINAL = os.getenv("TERMINAL") or "kitty"

keymap("n", "<C-p>", function()
  vim.cmd("w") -- Guardar el archivo .cpp actual

  local file = vim.fn.expand("%")
  local out = vim.fn.expand("%:r")

  -- Generar input/output si no existen para evitar que 'freopen' lance un error de lectura
  if vim.fn.filereadable("input.txt") == 0 then
    vim.fn.writefile({}, "input.txt")
  end
  if vim.fn.filereadable("output.txt") == 0 then
    vim.fn.writefile({}, "output.txt")
  end

  -- Ejecución limpia: tu código ya hace el freopen, así que solo lo corremos y leemos el output
  local exec_cmd = string.format(
    "g++ -O3 -std=c++20 -Wall %s -o %s && ./%s; echo '--- Resultado ---'; cat output.txt; echo; echo '--- Presiona ENTER para salir ---'; read",
    file, out, out
  )

  -- 1. Prepara la división horizontal en i3wm
  vim.fn.system("i3-msg split h")

  -- 2. Abre la terminal de forma nativa en Neovim
  vim.fn.jobstart({ TERMINAL, "-e", "sh", "-c", exec_cmd })
end, { silent = true, desc = "Compilar C++ Competitivo en i3wm" })
-- FIN DE COMPILACIÓN EN C++ --
