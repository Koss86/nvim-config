return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  event = "VeryLazy",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    window = {
      width = 23,
      height = 15,
    },
  },
}
