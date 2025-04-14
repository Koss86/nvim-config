return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic, bold",
          }
        }
      })
      vim.cmd('colorscheme github_dark_dimmed')
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        styles = {
          comments = { italic = false },
          keywords = {},
          functions = {},
          variables = {},
        },
        dim_inactive = true,
        lualine_bold = true,

        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
        end
      })
      vim.cmd('colorscheme tokyonight')
    end
  },
}
