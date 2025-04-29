return {
"folke/tokyonight.nvim",
lazy = false,
priority = 1000,
opts = {
  style = "night",
  styles = {
    comments = { italic = false, bold = true },
    functions = { bold = true },
  },
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end,
},
init = function()
  vim.cmd("colorscheme tokyonight")
end
}
