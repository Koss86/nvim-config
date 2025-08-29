return {
  {
    "jay-babu/mason-null-ls.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    event = "VeryLazy",
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
        ensure_installed = {
          "stylua",
          "clang_format",
        },
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
