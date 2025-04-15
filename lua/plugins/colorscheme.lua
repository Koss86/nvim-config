return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    comments = { italic = false },
    keywords = {},
    functions = {},
    variables = {},
    dim_inactive = true,
  },
  init = function()
    vim.cmd[[colorscheme tokyonight]]
  end
}
