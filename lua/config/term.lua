local M = {}

-- Internal state
local term_bufnum = nil
local term_winid = nil

function M.toggle()
  if term_bufnum and vim.api.nvim_buf_is_valid(term_bufnum) then
    if term_winid and vim.api.nvim_win_is_valid(term_winid) then
      vim.api.nvim_win_close(term_winid, true)
      term_winid = nil
    else
      vim.cmd("7split")
      term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_winid, term_bufnum)
    end
  else
    vim.cmd("7split")
    term_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    term_bufnum = vim.api.nvim_get_current_buf()
  end
end

return M
