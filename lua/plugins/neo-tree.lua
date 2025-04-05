return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
---@diagnostic disable-next-line: undefined-doc-name
    ---@type neotree.Config?
    opts = {
      -- fill any relevant options here
    },
  },
  vim.keymap.set('n' , '<leader>t', '<cmd>Neotree toggle<cr>', {} )
}
