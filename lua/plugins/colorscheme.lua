return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        style = "night",
        styles = {
          comments = { italic = true, bold = true },
          keywords = { italic = false, bold = true },
          functions = { italic = false, bold = true },
          variables = { italic = false, bold = false },
          dim_inactive = true,
          sidebars = "transparent",
          floats = "transparent",
        },
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
        end,
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "rose-pine/neovim",
    priority = 1000,
    -- lazy = true,
    name = "rose-pine",

    config = function()
      require("rose-pine").setup({
        variant = "moon",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = true,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true,        -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
}
