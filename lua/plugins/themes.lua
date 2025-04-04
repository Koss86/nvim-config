---@diagnostic disable: lowercase-global
return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
  -- Needs further work to ensure the themes below will load this way.
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      commentStyle = { italic = false }
      theme = "wave"
      background = {
        dark = "dragon",
        light = "wave",
      }
      vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      style = "night"
      styles = {
        comments = { italic = false },
        keywords = { italic = true },
      }
      cache = true
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
      end
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
