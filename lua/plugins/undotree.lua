return {
  "mbbill/undotree",
  event = "BufReadPre",
  config = function()
    vim.g.undotree_WindowLayout = 1
  end,
  keys = {
    { "<leader>ut", vim.cmd.UndotreeToggl, desc = "[u]ndo [t]ree" },
  },
}
