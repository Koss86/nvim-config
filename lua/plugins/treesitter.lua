return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "c", "go", "zig", "odin" },
      highlight = {
        enable = true,
      }
    })
  end
}
