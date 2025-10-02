return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
    },

    config = function()
      local map = vim.keymap
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "dropdown",
          },
          live_grep = {
            theme = "ivy",
          },
          help_tags = {
            theme = "ivy",
          },
        },
        extensions = {
          ["ui-select"] = {
            -- themes: get_dropdown, get_cursor, get_ivy
            require("telescope.themes").get_cursor({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")

      map.set("n", "<leader>ff", require("telescope.builtin").find_files)
      map.set("n", "<leader>fg", require("telescope.builtin").live_grep)
      map.set("n", "<leader>fh", require("telescope.builtin").help_tags)
      map.set("n", "<leader>en", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)

    end,
  },
}
