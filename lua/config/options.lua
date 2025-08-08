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
vim.opt["guicursor"] =
  "n-v:block-blinkon0,i-t-c-ci:block-blinkwait150-blinkon250-blinkoff250"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitbelow = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.breakindent = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo/"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "auto"
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = true
vim.opt.scrolloff = 20
vim.opt.inccommand = "split"
vim.opt.confirm = true

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
