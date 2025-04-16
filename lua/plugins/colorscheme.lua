return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon",
    styles = {
      comments = { italic = false },
      keywords = { italic = true, bold = true },
      functions = { bold = true },
      variables = {},
      dim_inactive = true,
    },
  },
  init = function()
    vim.cmd([[colorscheme tokyonight]])
    ---@diagnostic disable-next-line: lowercase-global
    on_colors = function(colors)
      colors.hint = colors.orange
      colors.error = "#ff0000"
    end
  end,
}
