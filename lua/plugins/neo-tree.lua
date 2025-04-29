return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    window = {
      width = 25,
      height = 20,
    },
    vim.keymap.set("n", "<leader>f", "<cmd>Neotree toggle<cr>", { desc = "Open NeoTree" } )
  }
}
