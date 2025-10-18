local map = vim.keymap
return {

  map.set(
    "n",
    "grd",
    "<C-w><C-]>",
    { desc = "Go to Definition (opens in split)" }
  ),
  map.set("n", "<leader>m", vim.lsp.buf.format, { desc = "For[m]at Document" }),
  map.set(
    "n",
    "<leader>d",
    vim.diagnostic.setloclist,
    { desc = "Open [d]iagnostic quickfix list" }
  ),

  -- This will still format document if buf.format() won't work.
  -- map.set(
  --   "n",
  --   "<leader>m",
  --   "gg=G<C-o>zz",
  --   { desc = "For[m]at Document" }
  -- ),

  map.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" }),
  map.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" }),
  map.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move line down" }),
  map.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move line up" }),
  map.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" }),
  map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" }),

  map.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down w/ view centering" }),
  map.set("n", "<C-u", "<C-u>zz", { desc = "Jump up w/ view centering" }),
  map.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" }),
  map.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" }),
  map.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" }),
  map.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" }),

  map.set("t", ";;", "<C-\\><C-n>", { desc = "Exit Terminal Mode" }),
  map.set("i", ";;", "<esc>", { desc = "Exit Insert Mode" }),

  map.set(
    "n",
    "<leader>hd",
    "0vf{%",
    { desc = "[h]ighlight function  [d]own" }
  ),
  map.set(
    "n",
    "<leader>hu",
    "0vf}%",
    { desc = "[h]ighlight function  [u]p" }
  ),
  map.set(
    { "n", "v" },
    "<leader>p",
    '"_dP',
    { desc = "Paste over highlighted text w/o replacing register" }
  ),

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
  map.set("n", "<Esc>", "<cmd>nohlsearch<CR>"),

  map.set(
    "n",
    "<leader>ut",
    vim.cmd.UndotreeToggle,
    { desc = "Toggle UndoTree" }
  ),

  map.set(
    "n",
    "<leader>on",
    "<cmd>Neotree toggle<cr>",
    { desc = "T[o]ggle [n]eo-tree" }
  ),

  map.set(
    "n",
    "<leader><leader>o",
    "<CMD>Oil --float<CR>",
    { desc = "Open parent directory" }
  ),

  -- Harpoon keymaps
  map.set("n", "<C-e>", function()
    require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
  end, { desc = "Harpoon Quick Menu" }),

  map.set("n", "<leader>a", function()
    require("harpoon"):list():add()
  end, {
    desc = "Harpoon [a]dd current file",
  }),

  map.set("n", "<leader>h", function()
    require("harpoon"):list():select(1)
  end, { desc = "Harpoon 1" }),

  map.set("n", "<leader>n", function()
    require("harpoon"):list():select(2)
  end, { desc = "Harpoon 2" }),

  map.set("n", "<leader>u", function()
    require("harpoon"):list():select(3)
  end, { desc = "Harpoon 3" }),

  map.set("n", "<leader>y", function()
    require("harpoon"):list():select(4)
  end, { desc = "Harpoon 4" }),

  map.set("n", "<leader><leader>h", function()
    require("harpoon"):list():select(5)
  end, { desc = "Harpoon 5" }),

  map.set("n", "<leader><leader>n", function()
    require("harpoon"):list():select(6)
  end, { desc = "Harpoon 6" }),

  map.set("n", "<leader><leader>u", function()
    require("harpoon"):list():select(7)
  end, { desc = "Harpoon 7" }),

  map.set("n", "<leader><leader>y", function()
    require("harpoon"):list():select(8)
  end, { desc = "Harpoon 8" }),

  map.set("n", "<C-S-P>", function()
    require("harpoon"):list():prev()
  end),

  map.set("n", "<C-S-N>", function()
    require("harpoon"):list():next()
  end),

  -- Open terminal in split window w/ reusable buffer.
  map.set({ "n", "t" }, "<leader>ot", function()
    require("config.custom").toggleSplitTerm()
  end, { desc = "T[o]ggle [t]erminal" }),

  -- Build Project(specific to my Tokyobash project)
  map.set("n", "<leader>make", function()
    require("config.custom").make_project()
  end, { desc = "Make Project" }),

  -- Compile a binary
  map.set("n", "<leader>co", function()
    require("config.custom").compile()
  end, { desc = "[c][o]mpile file" }),

  map.set("n", "<leader>lg", function()
    require("config.custom").openLazyGit()
  end, { desc = "Open [l]azy[g]it('qq' to exit)" }),
}
