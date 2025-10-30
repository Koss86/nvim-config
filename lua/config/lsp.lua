local config = vim.lsp.config
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = { "utf-16" }
return {

  vim.lsp.enable({
    "bashls",
    "clangd",
    "gopls",
    "lua_ls",
    "marksman",
    "ols",
    "pyright",
  }),

  config("bashls", {
    capabilities = capabilities,
  }),
  config("clangd", {
    capabilities = capabilities,
  }),
  config("gopls", {
    capabilities = capabilities,
  }),
  config("lua_ls", {
    capabilities = capabilities,
    settings = {
      Lua = {
        telemetry = {
          enable = false,
        },
        diagnostics = {
          globals = { "vim" },
        },
        runtime = {
          version = "LuaJIT",
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  }),
  config("marksman", {
    capabilities = capabilities,
  }),
  config("ols", {
    capabilities = capabilities,
  }),
  config("pyright", {
    capabilities = capabilities,
  }),

  vim.diagnostic.config({
    virtual_lines = true, -- New line style
    virtual_text = false, -- Original/Regular
    signs = true,
    underline = false,    -- Disabled for line style, to make more clear
    update_in_insert = false,
    severity_sort = false,
  }),

  -- Uncomment for native completions.
  -- vim.api.nvim_create_autocmd("LspAttach", {
  --   callback = function(ev)
  --     local client = vim.lsp.get_client_by_id(ev.data.client_id)
  --     if client:supports_method("textDocument/completion") then
  --       vim.lsp.completion.enable(
  --         true,
  --         client.id,
  --         ev.buf,
  --         { autotrigger = true }
  --       )
  --     end
  --   end,
  -- }),
  -- vim.cmd("set completeopt+=noselect"),
}
