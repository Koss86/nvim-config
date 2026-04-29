return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "location" },
        lualine_b = { "progress" },
        lualine_c = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
          },
          "%=",
          {
            "harpoon2",
            icon = "󰀱",
            indicators = { "h", "n", "u", "y", "h²", "n²", "u²", "y²" },
            active_indicators = { "[h]", "[n]", "[u]", "[y]", "[h²]", "[n²]", "[u²]", "[y²]" },
            color_active = { fg = "#00ff00" },
            _separator = " ",
            no_harpoon = "Harpoon not loaded",
          },
        },
        lualine_x = {},
        lualine_y = { "encoding", "fileformat", "filetype" },
        lualine_z = { "mode" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "lsp_status" },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
