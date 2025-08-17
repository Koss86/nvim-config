return {
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.formatting.clang_format.with({
            extra_args = { "--style=file" },
          }),
          require("null-ls").builtins.formatting.shfmt,
          --require("null-ls").builtins.formatting.pyink,
        },
      })
      require("mason-null-ls").setup({
        ensure_installed = { "clang_format", "stylua" },
      })
    end,
  },
}
-- {
--   "nvimtools/none-ls.nvim",
--   lazy = true,
--   event = { "BufReadPre", "BufNewFile" },
--   config = function()
--     require("null-ls").setup({
--       sources = {
--         require("null-ls").builtins.formatting.stylua,
--         require("null-ls").builtins.formatting.clang_format.with({
--           extra_args = { "--style=file" },
--         }),
--         --require("null-ls").builtins.formatting.pyink,
--       },
--     })
--   end,
-- },
