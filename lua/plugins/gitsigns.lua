return {

  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require("gitsigns").setup({

      on_attach = function(bufnr)
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
            require("gitsigns").nav_hunk("next")
          end
        end)

        map("n", "<leader>[", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            require("gitsigns").nav_hunk("prev")
          end
        end)

        -- Diff Views
        map("n", "dt", function()
          require("gitsigns").diffthis()
          vim.defer_fn(function()
            vim.cmd("wincmd h")
          end, 10) -- 10ms delay, try adjusting if not switching focus.
        end, { desc = "[d]iff [t]his File" })

        map(
          "n",
          "vd",
          require("gitsigns").preview_hunk_inline,
          { desc = "[v]iew [d]iff Inline" }
        )

        map(
          "n",
          "rh",
          require("gitsigns").reset_hunk,
          { desc = "[r]eset [h]unk" }
        )
      end,
    })
  end,
}
