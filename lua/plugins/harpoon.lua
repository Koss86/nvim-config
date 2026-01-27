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
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon [a]dd current file",
    },
    {
      "<C-e>",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "Harpoon [e]dit",
    },
    {
      "<leader>h",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon 1",
    },
    {
      "<leader>n",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon 2",
    },
    {
      "<leader>u",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon 3",
    },
    {
      "<leader>y",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon 4",
    },
    {
      "<leader><leader>h",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "Harpoon 5",
    },
    {
      "<leader><leader>n",
      function()
        require("harpoon"):list():select(6)
      end,
      desc = "Harpoon 6",
    },
    {
      "<leader><leader>u",
      function()
        require("harpoon"):list():select(7)
      end,
      desc = "Harpoon 7",
    },
    {
      "<leader><leader>y",
      function()
        require("harpoon"):list():select(8)
      end,
      desc = "Harpoon 8",
    },
    {
      "<C-S-P>",
      function()
        require("harpoon"):list():prev()
      end,
    },
    {
      "<C-S-N>",
      function()
        require("harpoon"):list():next()
      end,
    },
  },
}
