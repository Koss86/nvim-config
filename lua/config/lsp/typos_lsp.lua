return {
  cmd = { "typos-lsp" },
  root_markers = { "typos.toml", "_typos.toml", ".typos.toml", "pyproject.toml", "Cargo.toml" },
  settings = {},
  init_options = {
    config = vim.fn.stdpath("config") .. "/typos.toml",
  },
}
