return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({})
    vim.keymap.set(
      "n",
      "<leader>dt",
      require("gitsigns").diffthis,
      { desc = "[d]iff [t]his File" }
    )
  end,
}
