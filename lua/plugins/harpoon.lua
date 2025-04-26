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
    -- stylua: ignore start
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {
      desc = "[a]dd current file to Harpoon List" })
    vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>n", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>i", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>o", function() harpoon:list():select(4) end)

    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    -- stylua: ignore end
  end,
}
