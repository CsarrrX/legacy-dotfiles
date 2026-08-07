-- Ruta donde se instalará Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clonarlo de GitHub automáticamente
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

-- Añadir Lazy al "runtime path" de vim para poder usarlo
vim.opt.rtp:prepend(lazypath)

-- Cargar configuraciones básicas 
require("user.options")
require("user.keymaps")

-- Iniciar Lazy 
require("lazy").setup("user.plugins")

-- Cargar configuración de snippets
pcall(require, "user.snippets_config")

