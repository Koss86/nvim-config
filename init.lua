vim.opt.expandtab=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.have_nerd_font = true

require("config.lazy")
