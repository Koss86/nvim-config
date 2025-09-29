return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    debounce = 100,
    indent = { tab_char = "┃" },
  },
}
