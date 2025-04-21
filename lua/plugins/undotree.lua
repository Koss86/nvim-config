return {
  "mbbill/undotree",
  vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle),
  config = function()
    vim.g.undotree_WindowLayout = 2
  end,
}
