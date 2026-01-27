return {
  "chrisgrieser/nvim-origami",
  opts = {
    useLspFoldsWithTreesitterFallback = "enabled",
    pauseFoldsOnSearch = true,
    foldtext = {
      enabled = true,
      padding = 3,
      lineCount = {
        template = "%d lines", -- `%d` is replaced with the number of folded lines
        hlgroup = "Constant",
      },
      diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
      gitsignsCount = true, -- requires `gitsigns.nvim`
      disableOnFt = { "snacks_picker_input" },
    },
    autoFold = {
      enabled = true,
      kinds = { "comment", "imports" },
    },
    foldKeymaps = {
      setup = false, -- modifies `h`, `l`, and `$`
      hOnlyOpensOnFirstColumn = false,
    },
  },
  keys = {
    {
      "<leader>hh",
      function()
        require("origami").h()
      end,
    },
    {
      "<leader>ll",
      function()
        require("origami").l()
      end,
    },
    {
      "<leader>jj",
      function()
        require("origami").dollar()
      end,
    },
  },
}
