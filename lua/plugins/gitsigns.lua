return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({})
    vim.keymap.set("n", "<leader>dt", gitsigns.diffthis, { desc = "[d]iff [t]his File" })
  end,
}
