return {

  -- LSP related
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
  end),
  vim.keymap.set(
    "n",
    "<leader>gd",
    "<C-w><C-]>",
    { desc = "[g]o to [d]efinition (opens in split)" }
  ),
  vim.keymap.set(
    "n",
    "<leader>ca",
    vim.lsp.buf.code_action,
    { desc = "Display [c]ode [a]ctions" }
  ),
  -- vim.keymap.set(
  --   "n",
  --   "<leader>m",
  --   "gg=G<C-o>zz",
  --   { desc = "For[m]at Document" }
  -- ),
  vim.keymap.set(
    "n",
    "<leader>m",
    vim.lsp.buf.format,
    { desc = "For[m]at Document" }
  ),
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {}),

  -- Move line of text up or down
  vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" }),
  vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" }),
  vim.keymap.set(
    "i",
    "<A-j>",
    "<Esc>:m .+1<cr>==gi",
    { desc = "Move line down" }
  ),
  vim.keymap.set(
    "i",
    "<A-k>",
    "<Esc>:m .-2<cr>==gi",
    { desc = "Move line up" }
  ),
  vim.keymap.set(
    "v",
    "<A-j>",
    ":m '>+1<cr>gv=gv",
    { desc = "Move selection down" }
  ),
  vim.keymap.set(
    "v",
    "<A-k>",
    ":m '<-2<cr>gv=gv",
    { desc = "Move selection up" }
  ),
  vim.keymap.set(
    "n",
    "<leader>ld",
    "0vf{%",
    { desc = "high[l]ight function  [d]own" }
  ),
  vim.keymap.set(
    "n",
    "<leader>lu",
    "0vf}%",
    { desc = "high[l]ight function  [u]p" }
  ),

  vim.keymap.set(
    { "n", "v" },
    "<leader>p",
    '"_dP',
    { desc = "Paste over highlighted text w/o replacing register" }
  ),

  vim.keymap.set(
    "n",
    "<C-d>",
    "<C-d>zz",
    { desc = "Jump down w/ view centering" }
  ),
  vim.keymap.set(
    "n",
    "<C-u",
    "<C-u>zz",
    { desc = "Jump up w/ view centering" }
  ),

  vim.keymap.set(
    "n",
    "<space><space>x",
    "<cmd>source %<cr>",
    { desc = "Source Document" }
  ),
  vim.keymap.set(
    "n",
    "<space>x",
    "<cmd>.lua<cr>",
    { desc = "Execute Lua Document" }
  ),
  vim.keymap.set(
    "v",
    "<space>x",
    "<cmd>lua<cr>",
    { desc = "Execute line of Lua Code" }
  ),

  -- Compile a debug binary for C
  vim.keymap.set("n", "<leader>gcc", function()
    require("config.custom").gcc()
  end, { desc = "Compile debug binary" }),

  -- Compile and run .zig file
  vim.keymap.set("n", "<leader>run", function()
    require("config.custom").zig_build()
  end, { desc = "Run zig file" }),

  -- Open terminal in new window w/ reusable buffer.
  vim.keymap.set({ "n", "t" }, "<leader>ot", function()
    require("config.custom").toggleSplitTerm()
  end, { desc = "T[o]ggle [t]erminal" }),

  vim.keymap.set("n", "<leader>lg", function()
    require("config.custom").openLazyGit()
  end, { desc = "Toggle [l]azy[g]it" }),

  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>"),
  vim.keymap.set(
    "n",
    "<leader>d",
    vim.diagnostic.setloclist,
    { desc = "Open [d]iagnostic quickfix list" }
  ),
  vim.keymap.set("t", ";;", "<C-\\><C-n>", { desc = "Exit terminal mode" }),
  vim.keymap.set("i", ";;", "<esc>"),

  vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" }),
  vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" }),
  vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" }),
  vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" }),
}
