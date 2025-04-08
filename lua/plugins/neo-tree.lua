return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    opts = {
      window = { width = 27, height = 15, },
    },
  vim.keymap.set('n' , '<leader>f', ':Neotree toggle<cr>', {} )  },
}
