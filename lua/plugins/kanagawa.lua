return {
  { "rebelot/kanagawa.nvim", 
  config = function()
    require('kanagawa').setup({
      colors = {
	theme = "wave"
      }
    })
  end
  },
  vim.cmd("colorscheme kanagawa")
}
