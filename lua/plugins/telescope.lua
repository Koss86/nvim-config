return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    local map = vim.keymap
    require("telescope").setup({
      pickers = {
        find_files = { theme = "dropdown" },
        live_grep = { theme = "ivy" },
        help_tags = { theme = "ivy" },
      },
      extensions = {
        ["ui-select"] = {
          -- themes: get_dropdown, get_cursor, get_ivy
          require("telescope.themes").get_cursor({}),
        },
      },
    })

    require("telescope").load_extension("ui-select")

    -- Setup keymaps
    map.set("n", "<leader>ff", require("telescope.builtin").find_files)
    map.set("n", "<leader>fg", require("telescope.builtin").live_grep)
    map.set("n", "<leader>fh", require("telescope.builtin").help_tags)

    -- edit nvim config
    map.set("n", "<leader>en", function()
      require("telescope.builtin").find_files(
        { cwd = vim.fn.stdpath("config") },
        { desc = "[e]dit [n]vim config" }
      )
    end)

    -- edit my dotfiles
    map.set("n", "<leader>ec", function()
      require("telescope.builtin").find_files(
        { cwd = "~/repos/dotfiles" },
        { desc = " [e]dit [c]onfig files" }
      )
    end)
  end,
}
