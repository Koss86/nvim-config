return {
  "mbbill/undotree",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.g.undotree_WindowLayout = 1
  end,
}
