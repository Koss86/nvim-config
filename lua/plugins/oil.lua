return {
  "stevearc/oil.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("oil").setup()
  end,
}
