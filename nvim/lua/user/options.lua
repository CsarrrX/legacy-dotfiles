-- Variable para legibilidad
local opt = vim.opt

-- Líneas y números
opt.relativenumber = true -- Números relativos (útil para saltar líneas)
opt.number = true         -- Muestra el número de la línea actual

-- Tabulaciones (Indispensable para Python/Lua)
opt.tabstop = 4           -- Tamaño visual del tab
opt.shiftwidth = 4        -- Tamaño de la indentación
opt.expandtab = true      -- Convierte tabs en espacios

-- Comportamiento
opt.wrap = false          -- No ajustar líneas largas (prefiero scrollear)
opt.ignorecase = true     -- Búsqueda insensible a mayúsculas
opt.smartcase = true      -- ...a menos que escribas una mayúscula
opt.cursorline = true     -- Resalta la línea donde estás
opt.termguicolors = true  -- Colores reales (necesario para temas modernos)
opt.clipboard = "unnamedplus" -- Permite copiar/pegar
