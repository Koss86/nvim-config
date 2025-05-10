return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "tokyonight",
      --theme = "nightfly",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename", "lsp_status" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
