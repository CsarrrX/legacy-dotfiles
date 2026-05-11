-- Variable para legibilidad
local opt = vim.opt

-- Líneas y números
opt.relativenumber = true -- Números relativos
opt.number = true         -- Muestra el número de la línea actual

-- Tabulaciones 
opt.tabstop = 4           -- Tamaño visual del tab
opt.shiftwidth = 4        -- Tamaño de la indentación
opt.expandtab = true      -- Convierte tabs en espacios

-- Comportamiento
opt.wrap = false          -- No ajustar líneas largas 
opt.ignorecase = true     -- Búsqueda insensible a mayúsculas
opt.smartcase = true      
opt.cursorline = true     -- Resalta la línea donde estás
opt.termguicolors = true  -- Colores reales 
opt.clipboard = "unnamedplus" -- Permite copiar/pegar

-- TeX 
opt.conceallevel = 2 -- Mostrar símbolos
g.tex_conceal = "abdmg"
