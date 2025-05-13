---@diagnostic disable: need-check-nil
return {
  {
    "williamboman/mason.nvim",
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
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {},
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.clangd.setup({
        capabilities = capabilities,
        --init_options = {
        -- clangdFileStatus = true,
        -- usePlaceholders = true,
        -- completeUnimported = true,
        -- clangdInlayHints = {
        --  parameterHints = true,
        -- chainingHints = true,
        -- surroundingHints = true,
        --  },
        -- },
      })

      lspconfig.lua_ls.setup({
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        capabilities = capabilities,
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
      })

      lspconfig.ols.setup({
        capabilities = capabilities,
        init_options = {
          checker_args = "-strict-style",
          collections = {
            { name = "shared", path = "$HOME/local/Odin" },
          },
          enable_hover = true,
          enable_snippets = true,
          enable_semantic_tokens = true,
          enable_document_symbols = true,
          enable_inlay_hints = true,
          enable_procedure_snippet = false,
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client:supports_method("textDocument/implementation") then
            vim.keymap.set("n", "<leader>fi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
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

      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover({ border = "rounded" })
      end)
      vim.keymap.set("n", "<leader>gd", "<C-w><C-]>", { desc = "[g]o to [d]efinition (opens in split)" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Display [c]ode [a]ctions" })
      vim.keymap.set("n", "<leader>m", vim.lsp.buf.format, { desc = "For[m]at Document" })
    end,
  },
}
