local config = vim.lsp.config
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.offsetEncoding = { "utf-8" }
return {

  vim.lsp.enable({
    "bashls",
    "clangd",
    "lua_ls",
    "marksman",
    "ols",
    "typos_lsp",
  }),

  config("bashls", { capabilities = capabilities }),
  config("clangd", { capabilities = capabilities }),
  config("lua_ls", {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        runtime = { version = "LuaJIT" },
        telemetry = { enable = false },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      },
    },
  }),
  config("marksman", { capabilities = capabilities }),
  config("ols", { capabilities = capabilities }),
  config("typos_lsp", {
    capabilities = capabilities,
    cmd = { "typos-lsp" },
    cmd_env = { RUST_LOG = "error" },
    init_options = {
      config = vim.fn.stdpath("config") .. "/typos.toml",
      diagnosticSeverity = "Info",
    },
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
