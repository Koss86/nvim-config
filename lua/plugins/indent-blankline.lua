return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    debounce = 100,
    indent = { tab_char = "┃" },
  },
}
