return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    window = {
      width = 27,
      height = 15,
    },
  },
  vim.keymap.set("n", "<leader>f", "<cmd>Neotree toggle<cr>"),
}
