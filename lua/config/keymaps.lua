return {

  vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" }),
  vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" }),
  vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move line down" }),
  vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move line up" }),
  vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" }),
  vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" }),

  vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP', { desc = "Paste over highlighted text w/o replacing register" }),
  vim.keymap.set("n", "<C-d>", "<C-d>zz"),
  vim.keymap.set("n", "<C-u", "<C-u>zz"),
  vim.keymap.set({ "n", "t" }, ";;", function()
    require("config.custom").closeSplitTerm()
  end, { desc = "Exit Term" }),
  vim.keymap.set("n", "<space><space>x", "<cmd>source %<cr>", { desc = "Source Document" }),
  vim.keymap.set("n", "<space>x", "<cmd>.lua<cr>", { desc = "Execute Lua Document" }),
  vim.keymap.set("v", "<space>x", "<cmd>lua<cr>", { desc = "Execute line of Lua Code" }),

  -- Compile a debug binary for C
  vim.keymap.set("n", "<leader>gcc", function()
    require("config.custom").gcc()
  end, { desc = "Compile debug binary" }),

  -- Open terminal in new window w/ reusable buffer.
  vim.keymap.set("n", "<leader>tt", function()
    require("config.custom").toggleSplitTerm()
  end, { desc = "[t]oggle [t]erminal" }),
  --[[  vim.keymap.set("n", "<leader>gu", function()
    require("config.custom").openGitUi()
  end, { desc = "Toggle [g]it [u]i" }),
  ]]

  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>"),
  vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open [d]iagnostic quickfix list" }),
  vim.keymap.set("t", ";;", "<C-\\><C-n>", { desc = "Exit terminal mode" }),

  vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" }),
  vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" }),
  vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" }),
  vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" }),
}
