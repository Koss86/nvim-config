return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      styles = {
        comments = { italic = false },
        keywords = { italic = true, bold = true },
        functions = { italic = false, bold = true },
        variables = { italic = false, bold = false },
        dim_inactive = true,
      },
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
      end,
    },
    init = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = true,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          styles = {
            comments = "NONE",
            functions = "bold",
            keywords = "italic, bold",
            variables = "",
            conditionals = "bold",
            constants = "",
            numbers = "",
            operators = "bold",
            strings = "NONE",
            types = "NONE",
          },
        },
      })
    end,
  },
}
