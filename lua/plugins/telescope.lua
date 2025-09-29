return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = true,
    event = "VeryLazy",

    dependencies = {
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
              require("telescope.themes").get_cursor({}),
            },
          },
        })
        require("telescope").load_extension("ui-select")
      end,
    },
  },
}
