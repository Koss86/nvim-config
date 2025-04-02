return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    require("tokyonight").setup({
      style = "day",
      styles = {
	comments = { italic = true }, -- is it true
	keywords = { italic = true },
      },
      cache = true,
    })
  end, 
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end,
  config = function()
    vim.cmd[[colorscheme tokyonight]]
  end
}
