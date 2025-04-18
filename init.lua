vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.optsofttabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = " "

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.breakindent = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo/"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = false
vim.opt.scrolloff = 15
vim.opt.inccommand = "split"
vim.opt.confirm = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<cr>", { desc = "Source Document" })
vim.keymap.set("n", "<space>x", "<cmd>.lua<cr>", { desc = "Execute Lua Document" })
vim.keymap.set("v", "<space>x", "<cmd>lua<cr>", { desc = "Execute line of Lua Code" })
vim.keymap.set("n", "<leader>tt", "<cmd>:term<cr>", { desc = "Open [T]erminal" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open [d]iagnostic quickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

require("config.lazy")
