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
      default_component_configs = {
        containter = { 
          width = "3%",
        },
        window = {
          width = "10%",
        }
      }    
    },
  vim.keymap.set('n' , '<leader>t', ':Neotree toggle<cr>', {} )  },
}
