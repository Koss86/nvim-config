return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.clang_format, -- c, c++
          require("null-ls").builtins.formatting.gofumpt,      -- go-lang
          require("null-ls").builtins.formatting.prettier,     -- md, yaml, json
          require("null-ls").builtins.formatting.shfmt,        -- shell
          require("null-ls").builtins.formatting.stylua,       -- lua
        },
      })
    end,
  },
}
