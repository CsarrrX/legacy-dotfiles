return {
  -- 1. Estética (Tokyo Night)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme tokyonight]]) end,
  }, 

  -- 2. VimTex 
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.keymap.set('n', '<leader>ll', '<cmd>VimtexView<CR>', { desc = 'Ver PDF en Zathura' })
      vim.keymap.set('n', '<leader>lc', '<cmd>VimtexCompile<CR>', { desc = 'Compilación continua (Toggle)' })
    end,
  },

  -- 3. LuaSnip (Modo Standalone)
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

      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/user/snippets" })

      local keymap = vim.keymap.set
      
      -- Tecla TAB inteligente
      keymap({"i", "s"}, "<Tab>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        end
      end, { silent = true })

      keymap({"i", "s"}, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })
      
      -- Recargar config con <Espacio> + r
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

  -- 5. LSP nativo 
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
              enabled = true, 
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
              onSave = false,
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
      -- Keymaps LSP 
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

  -- 7. Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  -- 8. Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local builtin = require('telescope.builtin')
        
        -- Definición de Keymaps
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

        -- Configuración de Telescope
        require('telescope').setup({})
        require('telescope').load_extension('fzf')
    end
  },

}
