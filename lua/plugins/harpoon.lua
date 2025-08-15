return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("harpoon"):setup({
      settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })

    -- local conf = require("telescope.config").values
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --     table.insert(file_paths, item.value)
    --   end
    --
    --   require("telescope.pickers")
    --       .new({}, {
    --         prompt_title = "Harpoon",
    --         finder = require("telescope.finders").new_table({
    --           results = file_paths,
    --         }),
    --         previewer = conf.file_previewer({}),
    --         sorter = conf.generic_sorter({}),
    --       })
    --       :find()
    -- end
    -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end)

    vim.keymap.set("n", "<C-e>", function()
      require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
    end, { desc = "Harpoon Quick Menu" })

    vim.keymap.set("n", "<leader>a", function()
      require("harpoon"):list():add()
    end, {
      desc = "Harpoon [a]dd current file",
    })

    vim.keymap.set("n", "<leader>h", function()
      require("harpoon"):list():select(1)
    end, { desc = "Harpoon 1" })

    vim.keymap.set("n", "<leader>n", function()
      require("harpoon"):list():select(2)
    end, { desc = "Harpoon 2" })

    vim.keymap.set("n", "<leader>u", function()
      require("harpoon"):list():select(3)
    end, { desc = "Harpoon 3" })

    vim.keymap.set("n", "<leader>y", function()
      require("harpoon"):list():select(4)
    end, { desc = "Harpoon 4" })

    vim.keymap.set("n", "<leader><leader>h", function()
      require("harpoon"):list():select(5)
    end, { desc = "Harpoon 5" })

    vim.keymap.set("n", "<leader><leader>n", function()
      require("harpoon"):list():select(6)
    end, { desc = "Harpoon 6" })

    vim.keymap.set("n", "<leader><leader>u", function()
      require("harpoon"):list():select(7)
    end, { desc = "Harpoon 7" })

    vim.keymap.set("n", "<leader><leader>y", function()
      require("harpoon"):list():select(8)
    end, { desc = "Harpoon 8" })

    -- vim.keymap.set("n", "<C-S-P>", function()
    --   require("harpoon"):list():prev()
    -- end)
    --
    -- vim.keymap.set("n", "<C-S-N>", function()
    --   require("harpoon"):list():next()
    -- end)
  end,
}
