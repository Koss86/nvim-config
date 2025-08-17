return {
  "mbbill/undotree",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.g.undotree_WindowLayout = 1
  end,
}
