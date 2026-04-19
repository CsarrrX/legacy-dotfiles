local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
  history = true, 
  updateevents = "TextChanged,TextChangedI", 
  enable_autosnippets = true, 
})

-- Cargar snippets desde archivos lua en la carpeta user/snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/user/snippets" })
