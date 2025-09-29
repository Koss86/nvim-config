return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("harpoon"):setup({
      settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })
  end,
}
