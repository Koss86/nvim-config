local map = vim.keymap
return {

  -- LSP related keymaps.
  map.set("n", "grd", "<C-w><C-]>", { desc = "Open goto definition in a split" }),
  map.set("n", "<leader>m", vim.lsp.buf.format, { desc = "For[m]at Document" }),
  map.set("n", "<leader>d", vim.diagnostic.setloclist,
    { desc = "Open [d]iagnostic quickfix list" }),

  -- This will still format document if buf.format() won't work.
  -- map.set("n", "<leader>m", "gg=G<C-o>zz", { desc = "For[m]at Document" }),

  -- Move lines/selection.
  map.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" }),
  map.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" }),
  map.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move line down" }),
  map.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move line up" }),
  map.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" }),
  map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" }),

  -- View related.
  map.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" }),
  map.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" }),
  map.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" }),
  map.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" }),
  map.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down  w/ view centering" }),
  map.set("n", "<C-u", "<C-u>zz", { desc = "Jump up  w/ view centering" }),

  -- Open terminal in split window w/ reusable buffer.
  map.set({ "n", "t" }, "<leader>tt", function()
    require("config.custom").toggle_split_term()
  end, { desc = "[T]oggle [t]erminal" }),

  -- Misc
  map.set("t", ";;", "<C-\\><C-n>", { desc = "Exit Terminal Mode" }),
  map.set({ "i", "v" }, ";;", "<esc>", { desc = "Exit Insert/Visual Mode" }),
  map.set("n", "<leader>hd", "0vf{%", { desc = "[h]ighlight function  [d]own" }),
  map.set("n", "<leader>hu", "0Vf}%", { desc = "[h]ighlight function  [u]p" }),
  map.set("n", "<space>x", "<cmd>.lua<cr>", { desc = "Execute Lua Document" }),
  map.set("v", "<space>x", "<cmd>lua<cr>", { desc = "Execute line of Lua Code" }),
  map.set({ "n", "v" }, "<leader>p", '"_dP',
    { desc = "Paste over highlighted text w/o replacing register" }),
  map.set("n", "<space><space>x", "<cmd>source %<cr>",
    { desc = "Source Document" }),
  map.set("n", "<Esc>", "<cmd>nohlsearch<CR>",
    { desc = "Clear search highlights" }),

  map.set("n", "<leader>co", function()
    require("config.custom").compile()
  end, { desc = "[c][o]mpile file" }),

  map.set("n", "<leader>lg", function()
    require("config.custom").open_lazy_git()
  end, { desc = "Open [l]azy[g]it('qq' to exit)" }),

  -- Build Project(specific to my Tokyobash project)
  map.set("n", "<leader>make", function()
    require("config.custom").make_project()
  end, { desc = "Make Project" }),
}
