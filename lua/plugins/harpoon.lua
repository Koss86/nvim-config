return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "letieu/harpoon-lualine",
  },
  config = function()
    require("harpoon"):setup({
      settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })
  end,
}
