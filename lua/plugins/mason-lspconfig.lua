return {
  "mason-org/mason-lspconfig.nvim",
  event = "VeryLazy",
  opts = {
    ensure_installed = { "bashls", "lua_ls", "marksman", "ols", "typos_lsp" },
    automatic_enable = false,
  },
  dependencies = {
    {
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
    {
      "neovim/nvim-lspconfig",
    },
  },
}
