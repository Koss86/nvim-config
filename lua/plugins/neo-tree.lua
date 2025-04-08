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
    config = function ()
      require("neo-tree").setup({
      window = { { width = 10 }, },
    })
    end
  },
  vim.keymap.set('n' , '<leader>f', ':Neotree toggle<cr>', {} )
}
