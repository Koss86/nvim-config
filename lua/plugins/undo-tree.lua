return {
  "mbbill/undotree",
  config = function()
    vim.g.undotree_WindowLayout = 1
  end,
  vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle),
}
