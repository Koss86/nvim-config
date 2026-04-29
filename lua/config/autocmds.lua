return {
  -- Highlight when yanking, taken from kickstart.nvim
  vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
      vim.hl.on_yank()
    end,
  }),

  -- Install parsers & activate Treesitter highlighting
  -- Taken from https://github.com/nvim-treesitter/nvim-treesitter/discussions/8621
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function(args)
      local ft = vim.bo[args.buf].filetype
      local lang = vim.treesitter.language.get_lang(ft)
      ---@diagnostic disable-next-line: param-type-mismatch
      if not vim.treesitter.language.add(lang) then
        -- this stupid tracking is here only because
        -- they have added warnings on absent parsers
        local available = vim.g.ts_available or require("nvim-treesitter").get_available()
        if not vim.g.ts_available then
          vim.g.ts_available = available
        end
        if vim.tbl_contains(available, lang) then
          require("nvim-treesitter").install(lang)
        end
      end
      ---@diagnostic disable-next-line: param-type-mismatch
      if vim.treesitter.language.add(lang) then
        vim.treesitter.start(args.buf, lang)
        -- this is an experimental feature
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        -- vim.wo[0][0].foldmethod = "expr"
      end
    end,
  }),
}
