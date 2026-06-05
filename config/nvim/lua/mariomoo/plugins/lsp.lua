return {
  "neovim/nvim-lspconfig",
  dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      "j-hui/fidget.nvim",
  },

  config = function()
      require("fidget").setup()
      require("mason").setup()
      require("mason-lspconfig").setup({
          ensure_installed = {
              "gopls",
              "lua_ls",
              "golangci_lint_ls",
              "vue_ls",
              "ts_ls",
              "eslint",
          },
          handlers = {
              function(server_name)
                  require("lspconfig")[server_name].setup{}
              end,

              -- global vim variable
              ["lua_ls"] = function ()
                  require("lspconfig").lua_ls.setup{
                      settings = {
                          Lua = {
                              diagnostics = {
                                  globals = { "vim" }
                              }
                          }
                      }
                  }
              end,
              ["emmet_language_server"] = function()
                  require("lspconfig").emmet_language_server.setup{
                      filetypes = {
                          "vue", "templ", "html"
                      },
                  }
              end,
              ["eslint"] = function()
                  require("lspconfig").eslint.setup({
                      settings = {
                          format = { enable = true },
                          lintTask = {
                              enable = true
                          }
                      }
                  })
              end,
          },
      })

      -- ts_ls + vue_ls configured via native Neovim 0.11+ API so vue filetype is properly registered
      local vue_plugin_path = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
      vim.lsp.config("ts_ls", {
          init_options = {
              plugins = {
                  {
                      name = "@vue/typescript-plugin",
                      location = vue_plugin_path,
                      languages = { "vue" },
                      configNamespace = "typescript",
                  },
              },
          },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          settings = {
              typescript = {
                  preferences = {
                      importModuleSpecifier = "relative",
                  },
              },
          },
      })
      vim.lsp.enable("ts_ls")
      vim.lsp.config("vue_ls", {})
      vim.lsp.enable("vue_ls")

      -- diagnostics
      vim.diagnostic.config({
          virtual_text = true
      })


      -- completion
      local cmp = require("cmp")
      local cmp_select = {behavior = cmp.SelectBehavior.Select}

      cmp.setup({
          snippet = {
              expand = function(args)
                  require('luasnip').lsp_expand(args.body)
              end,
          },

          mapping = cmp.mapping.preset.insert({
              ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
              ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
              ['<C-y>'] = cmp.mapping.confirm({ select = true }),
              ["<C-Space>"] = cmp.mapping.complete(),
          }),

          sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
          }, {
              { name = 'buffer' },
          })
      })

  end
}
