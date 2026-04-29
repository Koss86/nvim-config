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
      keys = {
        vim.keymap.set("n", "<leader>M", function()
          vim.cmd("Mason")
        end, { desc = "Open Mason" }),
      },
    },
  },
}
