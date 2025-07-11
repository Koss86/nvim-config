---@diagnostic disable: need-check-nil
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "lua_ls", "clangd", "ols", "zls" },
    },
    dependencies = {
      "mason-org/mason.nvim",
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      --local lspconfig = require("lspconfig")
      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        settings = {
          cmd = { "lua-language-server" },
          filetypes = { "lua" },
          capabilities = capabilities,
          telemetry = {
            enable = false,
          },
          settings = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
      vim.lsp.config("ols", {
        settings = {
          capabilities = capabilities,
          init_options = {
            checker_args = "-strict-style",
            collections = {
              { name = "shared", path = "$HOME/.local/Odin" },
            },
            enable_hover = true,
            enable_snippets = true,
            enable_semantic_tokens = true,
            enable_document_symbols = true,
            enable_inlay_hints = true,
            enable_procedure_snippet = false,
          },
        },
      })

      vim.lsp.config("bashls", {
        capabilities = capabilities,
      })
      vim.lsp.config("pylsp", {
        capabilities = capabilities,
      })
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client:supports_method("textDocument/implementation") then
            vim.keymap.set(
              "n",
              "<leader>fi",
              vim.lsp.buf.implementation,
              { desc = "Go to Implementation" }
            )
          end

          if
              not client:supports_method("textDocument/willSaveWaitUntil")
              and client:supports_method("textDocument/formatting")
          then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  },
}
