-- ~/.config/nvim/lua/user/snippets_config.lua
local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
  history = true, -- Mantiene historia para poder regresar atrás en un snippet
  updateevents = "TextChanged,TextChangedI", -- Actualiza mientras escribes
  enable_autosnippets = true, -- ¡Clave! Permite expansión automática sin presionar Tab
})

-- Cargar snippets desde archivos lua en la carpeta user/snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/user/snippets" })
