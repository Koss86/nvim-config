vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.optsofttabstop = 2
vim.opt.shiftwidth = 2
vim.g.mapleader = " "
vim.opt["guicursor"] = "n-v:block-blinkon0,i-t-c-ci:block-blinkwait150-blinkon250-blinkoff250"

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

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
vim.opt.scrolloff = 15
vim.opt.inccommand = "split"
vim.opt.confirm = true

--[[ Toggle between two different colorschemes
vim.keymap.set("n", "<leader>cs", function()
  if vim.g.colors_name == "tokyonight-night" then
    vim.cmd("colorscheme github_dark_dimmed")
  else
    vim.cmd("colorscheme tokyonight")
  end
end, { desc = "Toggle [c]olor[s]cheme" })
]]

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
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
require("config.keymaps")
