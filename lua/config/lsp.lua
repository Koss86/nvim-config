return {

  vim.lsp.config("lua_ls", {
    settings = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  }),

  vim.lsp.enable({
    "lua_ls",
    "clangd",
    "marksman",
    "gopls",
    "bashls",
  }),

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("enable_virtual_text", {}),
    callback = function()
      vim.diagnostic.config({
        virtual_lines = true,   -- New line style
        virtual_text = false,   -- Original/Regular
        signs = true,
        underline = false,      -- Disabled for line style, to make more clear
        update_in_insert = false,
        severity_sort = false,
      })
    end,
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
