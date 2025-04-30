return {
  vim.keymap.set("n", "<C-u", "<C-u>zz"),
  vim.keymap.set("n", "<C-d", "<C-d>zz"),
  vim.keymap.set("i", ";;", "<Esc>", { desc = "Exit Insert Mode" }),
  vim.keymap.set("n", "<space><space>x", "<cmd>source %<cr>", { desc = "Source Document" }),
  vim.keymap.set("n", "<space>x", "<cmd>.lua<cr>", { desc = "Execute Lua Document" }),
  vim.keymap.set("v", "<space>x", "<cmd>lua<cr>", { desc = "Execute line of Lua Code" }),
  -- Open terminal in new window w/ reusable buffer.,
  vim.keymap.set("n", "<leader>tt", function()
    require("config.term").toggle()
  end, { desc = "[t]oggle [t]erminal" }),

  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>"),
  vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open [d]iagnostic quickfix list" }),
  vim.keymap.set("t", ";;", "<C-\\><C-n>", { desc = "Exit terminal mode" }),

  vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" }),
  vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" }),
  vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" }),
  vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" }),
}
