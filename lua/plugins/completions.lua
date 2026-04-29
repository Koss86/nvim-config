return {
  {
    "L3MON4D3/LuaSnip",
    event = { "BufReadPre", "BufNewFile" },
    version = "v2.*",
    build = "make install_jsregexp",
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("cmp").setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = require("cmp").config.window.bordered(),
          documentation = require("cmp").config.window.bordered(),
        },
        mapping = require("cmp").mapping.preset.insert({
          ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
          ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
          ["<C-Space>"] = require("cmp").mapping.complete(),
          ["<C-a>"] = require("cmp").mapping.abort(),
          ["<CR>"] = require("cmp").mapping.confirm({ select = false }),
        }),
        sources = require("cmp").config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, { { name = "buffer" } }),
      })
    end,
  },
}
