return {
  {
    "projekt0n/github-nvim-theme",
    enabled = true,
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd('colorscheme github_dark_dimmed')
    end
  },
  -- Needs further work to ensure the themes below will load this way.
  {
    "rebelot/kanagawa.nvim",
    opts = {
      enabled = false,
      commentStyle = { italic = false },
      theme = "wave",
      background = {
        dark = "dragon",
        light = "wave",
      },
    },
  },
  "folke/tokyonight.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    styles = {
      comments = { italic = false },
      keywords = { italic = true },
    },
    cache = true,
    on_colors = function(colors)
      colors.hint = colors.orange
      colors.error = "#ff0000"
    end,
  },
}
