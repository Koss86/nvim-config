---@diagnostic disable: need-check-nil
return {
  {
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    }),
  },

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
      local lsp = vim.lsp

      lsp.config("clangd", {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_markers = {
          ".clangd",
          ".clang-tidy",
          ".clang-format",
          "compile_commands.json",
          "compile_flags.txt",
          "configure.ac", -- AutoTools
          ".git",
        },
        capabilities = {
          textDocument = {
            completion = {
              editsNearCursor = true,
            },
          },
          offsetEncoding = { "utf-8", "utf-16" },
        },
        ---@param client vim.lsp.Client
        ---@param init_result ClangdInitializeResult
        on_init = function(client, init_result)
          if init_result.offsetEncoding then
            client.offset_encoding = init_result.offsetEncoding
          end
        end,
        on_attach = function(_, bufnr)
          vim.api.nvim_buf_create_user_command(
            bufnr,
            "LspClangdSwitchSourceHeader",
            function()
              switch_source_header(bufnr)
            end,
            { desc = "Switch between source/header" }
          )

          vim.api.nvim_buf_create_user_command(
            bufnr,
            "LspClangdShowSymbolInfo",
            function()
              symbol_info()
            end,
            { desc = "Show symbol info" }
          )
        end,
      })

      lsp.config("lua_ls", {
        settings = {
          cmd = { "lua-language-server" },
          filetypes = { "lua" },
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
      lsp.config("ols", {
        settings = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
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

      lsp.config("bashls", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      lsp.config("pylsp", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      lsp.config("jsonls", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
