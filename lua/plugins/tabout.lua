return {
  "abecodes/tabout.nvim",
  opt = true,
  event = "InsertCharPre",
  priority = 1000,

  config = function()
    require("tabout").setup({
      ignore_beginning = true,
      exclude = {}, -- tabout will ignore these filetypes
    })
  end,
}
