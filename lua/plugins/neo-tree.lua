return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    window = {
      width = 23,
      height = 15,
    },
  },
  keys = {
    { "<leader>on", "<cmd>Neotree toggle<cr>", desc = "T[o]ggle [n]eotree" },
  },
}
