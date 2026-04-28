local enable = vim.lsp.enable
local config = vim.lsp.config
local diag_config = vim.diagnostic.config

return {

  enable({
    "bashls",
    "clangd",
    "lua_ls",
    "marksman",
    "ols",
    "typos_lsp",
    "tombi",
    "zls",
  }),

  config("bashls", require "config.lsp.bashls"),
  config("clangd", require "config.lsp.clangd"),
  config("lua_ls", require "config.lsp.lua_ls"),
  config("marksman", require "config.lsp.marksman"),
  config("ols", require "config.lsp.ols"),
  config("tombi", require "config.lsp.tombi"),
  config("typos_lsp", require "config.lsp.typos_lsp"),
  config("zls", require "config.lsp.zls"),

  diag_config({
    virtual_lines = true,
    virtual_text = false,
    underline = false,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
  }),

  -- Uncomment for native completions.
  -- vim.api.nvim_create_autocmd("LspAttach", {
  --   callback = function(ev)
  --     local client = vim.lsp.get_client_by_id(ev.data.client_id)
  --     local buf = ev.buf
  --     -- if client:supports_method("textDocument/completion") then
  --     if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
  --       vim.lsp.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
  --       vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
  --       vim.keymap.set("i", "<C-Space>", function()
  --         vim.lsp.completion.get()
  --       end, { desc = "" })
  --     end
  --   end,
  -- }),
  -- vim.cmd("set completeopt+=noselect"),
}
