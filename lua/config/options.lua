vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.culopt = "both"
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.g.mapleader = " "
vim.opt["guicursor"] =
  "n-v:block-blinkon0,i-t-c-ci:block-blinkwait150-blinkon250-blinkoff250"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitbelow = true
vim.o.wrap = true
vim.o.swapfile = false
vim.o.breakindent = true
vim.o.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo/"
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.list = true
vim.opt.listchars = { tab = "┃ ", trail = "·", nbsp = "␣" }
vim.o.scrolloff = 20
vim.o.inccommand = "split"
vim.o.confirm = true
vim.o.winborder = "rounded"

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
  virtural_lines = true,
  virtural_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Hightlight when yanking, taken from kickstart
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup(
    "kickstart-highlight-yank",
    { clear = true }
  ),
  callback = function()
    vim.hl.on_yank()
  end,
})
