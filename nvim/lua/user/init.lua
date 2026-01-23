-- 1. Definir la ruta donde se instalará el gestor de plugins (Lazy)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 2. Si no existe, clonarlo de GitHub automáticamente (BOOTSTRAP)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- usar la versión estable
    lazypath,
  })
end

-- 3. Añadir Lazy al "runtime path" de vim para poder usarlo
vim.opt.rtp:prepend(lazypath)

-- 4. Cargar nuestras configuraciones básicas PRIMERO
require("user.options")
require("user.keymaps")

-- 5. Iniciar Lazy y decirle dónde están los plugins
require("lazy").setup("user.plugins")

-- Cargar configuración de snippets
pcall(require, "user.snippets_config")

