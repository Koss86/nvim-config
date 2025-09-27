return {
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,
    event = "VeryLazy",

    opts = {
      ensure_installed = { -- auto install LSP's
        "lua_ls",
        "clangd",
        "marksman",
        "gopls",
      },
    },

    dependencies = {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "",
            package_uninstalled = "✗",
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
  },
}
