return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    -- Navigate
    {
      "<leader>]",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          require("gitsigns").nav_hunk("next")
        end
      end,
    },
    {
      "<leader>[",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end,
    },
    -- Diff views
    {
      "dt",
      function()
        require("gitsigns").diffthis()
        vim.defer_fn(function()
          vim.cmd("wincmd h")
        end, 10)
      end,
      desc = "[d]iff [t]his File",
    },
    {
      "vd",
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      desc = "[v]iew [d]iff Inline",
    },
    -- Reset
    {
      "rh",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "[r]eset [h]unk",
    },
  },
}
