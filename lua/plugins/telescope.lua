return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- change opts for ui-select theme? here
          },
        },
      },
    })
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>en", function()
      builtin.find_files({
        cwd = vim.fn.stdpath("config") })
      end, { desc = "[e]dit [n]vim Config" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
    end,
    init = function()
      require("telescope").load_extension("ui-select")
    end
  }
