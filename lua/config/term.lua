local M = {}

-- Internal state
local term_bufnr = nil
local term_winid = nil

function M.toggle()
  if term_bufnr and vim.api.nvim_buf_is_valid(term_bufnr) then
    if term_winid and vim.api.nvim_win_is_valid(term_winid) then
      vim.api.nvim_win_close(term_winid, true)
      term_winid = nil
    else
      vim.cmd("5split")
      term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_winid, term_bufnr)
    end
  else
    vim.cmd("5split")
    term_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    term_bufnr = vim.api.nvim_get_current_buf()
  end
end

return M
