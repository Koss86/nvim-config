return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup()
  end,
  keys = {
    { "<leader><leader>o", "<CMD>Oil --float<CR>" },
  },
}
