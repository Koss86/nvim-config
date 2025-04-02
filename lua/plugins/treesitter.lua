return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "c", "lua", },
    sync_install = false,
    highlight = { enabled = true },
    indent = { enable = true },
  },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
}
