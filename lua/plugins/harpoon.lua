return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })

    --[[
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
    end
    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end)
    ]]
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon Quick Menu" })

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, {
      desc = "Harpoon [a]dd current file",
    })
    vim.keymap.set("n", "<leader>h", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon 1" })
    vim.keymap.set("n", "<leader>n", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon 2" })
    vim.keymap.set("n", "<leader>u", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon 3" })
    vim.keymap.set("n", "<leader>y", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon 4" })

    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end)
  end,
}
