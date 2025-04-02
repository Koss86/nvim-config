return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,

  config = function ()
    require("tokyonight").setup({
      style = "night",
      styles = {
	comments = { italic = false },
	keywords = { italic = true },
      },
      cache = true,
      on_colors = function(colors)
	colors.hint = colors.orange
	colors.error = "#ff0000"
      end
    })
    vim.cmd[[colorscheme tokyonight]]
  end,
}
