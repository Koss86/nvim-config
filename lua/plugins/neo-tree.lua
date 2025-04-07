return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {
      window = { width = 30, height = 15, },
    },
  vim.keymap.set('n' , '<leader>t', ':Neotree toggle<cr>', {} )  },
}
