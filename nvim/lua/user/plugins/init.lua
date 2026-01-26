-- ~/.config/nvim/lua/user/plugins/init.lua
return {
  -- 1. Estética (Tokyo Night)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme tokyonight]]) end,
  }, -- <--- IMPORTANTE: Esta coma separa los plugins

  -- 2. VimTex (Con carpeta de compilación limpia)
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- Tu visor (ya sabemos que funciona)
      vim.g.vimtex_view_method = "zathura"
      -- Configuración del Índice (TOC)
      vim.g.vimtex_toc_config = {
        name = 'Índice de Análisis',
        layers = { 'content', 'include' }, 
        split_width = 35,
        show_numbers = 1, -- Autonumera: Prop 1, Prop 2...
        mode = 1,
      }

      -- Agregamos Lema y Axioma a la lista de reconocimiento
      vim.g.vimtex_toc_custom_matchers = {
        {title = 'Prop', re = [[\\begin{proposicion}]]},
        {title = 'Def',  re = [[\\begin{definicion}]]},
        {title = 'Teo',  re = [[\\begin{teorema}]]},
        {title = 'Lem',  re = [[\\begin{lema}]]},
        {title = 'Axm',  re = [[\\begin{axioma}]]},
      }
    end,
  },

  -- 3. LuaSnip (Modo Standalone - Velocidad Pura)
  {
    "L3MON4D3/LuaSnip",
    lazy = false, 
    config = function()
      local ls = require("luasnip")

      -- Configuración del motor
      ls.config.set_config({
        history = true, 
        updateevents = "TextChanged,TextChangedI", 
        enable_autosnippets = true, 
      })

      -- Cargar tus snippets de la carpeta user/snippets
      -- Asegúrate de que esta ruta exista
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/user/snippets" })

      -- === MAPEOS MANUALES (Reemplazo del Tab) ===
      local keymap = vim.keymap.set
      
      -- Tecla TAB inteligente
      keymap({"i", "s"}, "<Tab>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          -- Envía un Tab real si no hay snippet
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        end
      end, { silent = true })

      -- Tecla SHIFT+TAB para regresar
      keymap({"i", "s"}, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
      
      -- Recargar config rápido con <Espacio> + r
      keymap("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>", { desc = "Recargar Config" })
    end,
  },
    
  -- 4. Autocompletado
    {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local ls = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            ls.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<C-Space>"] = cmp.mapping.complete(),

          ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif ls.expand_or_jumpable() then
              ls.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["C-p"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif ls.jumpable(-1) then
              ls.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
  -- 5. LSP NATIVO (Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
    
      -- ==========================
      -- PYTHON
      -- ==========================
      vim.lsp.config.pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        root_markers = { "pyproject.toml", ".git" },
      }
  
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function(ev)
          vim.lsp.start(vim.lsp.config.pyright, {
            bufnr = ev.buf,
          })
        end,
      })
  
      -- ==========================
      -- C / C++
      -- ==========================
      vim.lsp.config.clangd = {
        cmd = { "clangd" },
        root_markers = { "compile_commands.json", ".git" },
      }
  
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp" },
        callback = function(ev)
          vim.lsp.start(vim.lsp.config.clangd, {
            bufnr = ev.buf,
          })
        end,
      })
  
      -- ==========================
      -- LaTeX (TEXLAB)
      -- ==========================
      vim.lsp.config.texlab = {
        cmd = { "texlab" },
        filetypes = { "tex", "plaintex", "bib" },
        root_markers = { ".git", "main.tex" },
  
        settings = {
          texlab = {
            completion = {
              enabled = true, -- <- clave para nvim-cmp
            },
  
            diagnostics = {
              ignoredPatterns = {
                "Overfull",
                "Underfull",
              },
            },
  
            build = {
              executable = "latexmk",
              args = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
                "%f",
              },
              onSave = false, -- no compila al guardar (VimTeX ya se encarga)
            },
  
            forwardSearch = {
              executable = "zathura",
              args = {
                "--synctex-forward",
                "%l:1:%f",
                "%p",
              },
            },
          },
        },
      }
  
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "tex", "plaintex", "bib" },
        callback = function(ev)
          vim.lsp.start(vim.lsp.config.texlab, {
            bufnr = ev.buf,
          })
        end,
      })
  
      -- ==========================
      -- Keymaps LSP (comunes)
      -- ==========================
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
  
    end,
  },

  -- 6. Telescope para finding --
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          -- Ignora archivos auxiliares de LaTeX para que no estorben en la búsqueda
          file_ignore_patterns = { "%.aux", "%.log", "%.toc", "%.pdf", "%.gz", "%.fls", "%.fdb_latexmk" },
          layout_strategy = 'horizontal',
          layout_config = { 
            preview_width = 0.6,
            width = 0.95 
          },
        }
      })
    end
  },
}
