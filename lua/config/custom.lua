local M = {}

-- Internal state
local term_bufnum = nil
local term_winid = nil
local term_gui_winid = nil
local term_gui_bufnum = nil

function M.openSplitTerm()
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

function M.openGitUi()
  if term_gui_bufnum and vim.api.nvim_buf_is_valid(term_gui_bufnum) then
    if term_gui_winid and vim.api.nvim_win_is_valid(term_gui_winid) then
      vim.api.nvim_win_close(term_gui_winid, true)
      term_gui_winid = nil
    else
      vim.cmd("40split")
      term_gui_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_gui_winid, term_gui_bufnum)
    end
  else
    vim.cmd("40split")
    term_gui_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal gitui")
    term_gui_bufnum = vim.api.nvim_get_current_buf()
  end
end

return M
