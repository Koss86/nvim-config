return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
      styles = {
        comments = { italic = false },
        keywords = { italic = true, bold = false },
        functions = { bold = true },
        variables = {},
        dim_inactive = true,
      },
    },
    init = function()
      vim.cmd("colorscheme tokyonight")
      ---@diagnostic disable-next-line: lowercase-global
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
      end
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
            keywords = "NONE",
            variables = "NONE",
            conditionals = "NONE",
            constants = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
          },
        },
      })
      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
}
