local map = vim.keymap
return {

  -- LSP related
  map.set("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
  end),

  map.set(
    "n",
    "<leader>gd",
    "<C-w><C-]>",
    { desc = "[g]o to [d]efinition (opens in split)" }
  ),

  map.set("n", "<leader>m", vim.lsp.buf.format, { desc = "For[m]at Document" }),
  map.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" }),

  map.set(
    "n",
    "<leader>ca",
    vim.lsp.buf.code_action,
    { desc = "Display [c]ode [a]ctions" }
  ),
  -- map.set(
  --   "n",
  --   "<leader>m",
  --   "gg=G<C-o>zz",
  --   { desc = "For[m]at Document" }
  -- ),

  -- Move line of text up or down
  map.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" }),
  map.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" }),
  map.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move line down" }),
  map.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move line up" }),
  map.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" }),
  map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" }),
  map.set(
    "n",
    "<leader>ld",
    "0vf{%",
    { desc = "high[l]ight function  [d]own" }
  ),
  map.set(
    "n",
    "<leader>lu",
    "0vf}%",
    { desc = "high[l]ight function  [u]p" }
  ),

  map.set(
    { "n", "v" },
    "<leader>p",
    '"_dP',
    { desc = "Paste over highlighted text w/o replacing register" }
  ),

  map.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down w/ view centering" }),
  map.set("n", "<C-u", "<C-u>zz", { desc = "Jump up w/ view centering" }),

  map.set(
    "n",
    "<space><space>x",
    "<cmd>source %<cr>",
    { desc = "Source Document" }
  ),
  map.set("n", "<space>x", "<cmd>.lua<cr>", { desc = "Execute Lua Document" }),
  map.set(
    "v",
    "<space>x",
    "<cmd>lua<cr>",
    { desc = "Execute line of Lua Code" }
  ),

  -- Compile a debug binary for C
  map.set("n", "<leader>gcc", function()
    require("config.custom").gcc()
  end, { desc = "Compile debug binary" }),

  -- Compile and run .zig file
  map.set("n", "<leader>zig", function()
    require("config.custom").zig_build()
  end, { desc = "Build zig file" }),

  -- Build Project
  map.set("n", "<leader>make", function()
    require("config.custom").make_project()
  end, { desc = "Make Project" }),

  -- Open terminal in new window w/ reusable buffer.
  map.set({ "n", "t" }, "<leader>ot", function()
    require("config.custom").toggleSplitTerm()
  end, { desc = "T[o]ggle [t]erminal" }),

  map.set("n", "<leader>lg", function()
    require("config.custom").openLazyGit()
  end, { desc = "Toggle [l]azy[g]it" }),

  map.set("n", "<Esc>", "<cmd>nohlsearch<CR>"),
  map.set(
    "n",
    "<leader>d",
    vim.diagnostic.setloclist,
    { desc = "Open [d]iagnostic quickfix list" }
  ),
  map.set("t", ";;", "<C-\\><C-n>", { desc = "Exit Terminal Mode" }),
  map.set("i", ";;", "<esc>", { desc = "Exit Insert Mode" }),

  map.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" }),
  map.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" }),
  map.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" }),
  map.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" }),
}
