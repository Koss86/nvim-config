return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
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
            require("telescope.themes").get_cursor({
              -- more opts
            }),
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags)
      vim.keymap.set("n", "<leader>en", function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)
    end,

    init = function()
      require("telescope").load_extension("ui-select")
    end,
  },
}
