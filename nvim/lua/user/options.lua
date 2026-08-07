-- Variable para legibilidad
local opt = vim.opt

-- Líneas y números
opt.relativenumber = true 
opt.number = true         

-- Tabulaciones 
opt.tabstop = 4           
opt.shiftwidth = 4        
opt.expandtab = true      

-- Comportamiento
opt.wrap = false          
opt.ignorecase = true     
opt.smartcase = true      
opt.cursorline = true     
opt.termguicolors = true  
opt.clipboard = "unnamedplus" 

-- TeX 
opt.conceallevel = 2 
vim.g.tex_conceal = "abdmg"
