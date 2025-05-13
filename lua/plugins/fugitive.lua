return {
  "tpope/vim-fugitive",
  vim.keymap.set("n", "<leader>fd", "<cmd>Git diff<cr>"),
  vim.keymap.set("n", "<leader>fl", "<cmd>Git log<cr>"),
  vim.keymap.set("n", "<leader>fc", "<cmd>Git commit<cr>"),
  vim.keymap.set("n", "<leader>fa", "<cmd>Git add .<cr>"),
}
