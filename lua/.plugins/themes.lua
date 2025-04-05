---@diagnostic disable: lowercase-global
return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
  --[[
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
  ]]

  --[[
  {
    "folke/tokyonight.nvim",
    lazy = true,
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
      vim.cmd("colorscheme tokyonight")
    end,
  },
]]
}
