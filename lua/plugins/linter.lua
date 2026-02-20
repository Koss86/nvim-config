return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lint.linters.codespell").cmd = "codespell"

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("RunLinter", { clear = true }),
        callback = function()
          require("lint").try_lint("codespell")
        end,
      })
    end,
  }
}
