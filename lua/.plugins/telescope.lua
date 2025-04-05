return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local builtin = require("telescope.builtin")
      require("telescope").setup({
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" }),
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" }),
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" }),
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" }),
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_cursor({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
