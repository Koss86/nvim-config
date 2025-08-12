---@diagnostic disable: param-type-mismatch
return {
  "lewis6991/gitsigns.nvim",

  config = function()
    require("gitsigns").setup({

      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "<leader>]", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end)

        map("n", "<leader>[", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        -- Diff Views
        vim.keymap.set(
          "n",
          "<leader>dt",
          require("gitsigns").diffthis,
          { desc = "[d]iff [t]his File" }
        )

        vim.keymap.set(
          "n",
          "<leader>vd",
          gitsigns.preview_hunk_inline,
          { desc = "[v]iew [d]iff Inline" }
        )
        map("n", "<leader>rh", gitsigns.reset_hunk, { desc = "[r]eset [h]unk" })
      end,
    })
  end,
}
