local M = {}

local term_bufnum = nil
local term_winid = nil

-- Toggle terminal in a split window.
function M.toggleSplitTerm()
  if term_bufnum and vim.api.nvim_buf_is_valid(term_bufnum) then
    if term_winid and vim.api.nvim_win_is_valid(term_winid) then
      vim.api.nvim_win_close(term_winid, true)
      term_winid = nil
    else
      vim.cmd("9split")
      term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_winid, term_bufnum)
      vim.fn.feedkeys("i")
    end
  else
    vim.cmd("9split")
    term_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    term_bufnum = vim.api.nvim_get_current_buf()
    vim.fn.feedkeys("i")
  end
end

-- Open lazygit. Tap q twice to exit.
function M.openLazyGit()
  vim.cmd("enew")
  vim.cmd("terminal lazygit")
  vim.fn.feedkeys("i")
end

-- Compile a debug C binary.
function M.gcc()
  local file_path = vim.fn.expand("%:p")
  if term_bufnum and vim.api.nvim_buf_is_valid(term_bufnum) then
    if term_winid and vim.api.nvim_win_is_valid(term_winid) then
      vim.api.nvim_set_current_win(term_winid)
      vim.fn.execute("!gcc -Og -Wall -I. " .. file_path)
      vim.fn.feedkeys("i")
    else
      vim.cmd("9split")
      term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_winid, term_bufnum)
      vim.fn.execute("!gcc -Og -Wall -I. " .. file_path)
      vim.fn.feedkeys("i")
    end
  else
    vim.cmd("9split")
    term_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    term_bufnum = vim.api.nvim_get_current_buf()
    vim.fn.execute("!gcc -Og -Wall -I. " .. file_path)
    vim.fn.feedkeys("i")
  end
end

function M.zig_build()
  local file_path = vim.fn.expand("%:p")
  if term_bufnum and vim.api.nvim_buf_is_valid(term_bufnum) then
    if term_winid and vim.api.nvim_win_is_valid(term_winid) then
      vim.api.nvim_set_current_win(term_winid)
      vim.fn.execute("!zig build-exe " .. file_path)
      vim.fn.feedkeys("i")
    else
      vim.cmd("9split")
      term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_winid, term_bufnum)
      vim.fn.execute("!zig build-exe " .. file_path)
      vim.fn.feedkeys("i")
    end
  else
    vim.cmd("9split")
    term_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    term_bufnum = vim.api.nvim_get_current_buf()
    vim.fn.execute("!zig build-exe " .. file_path)
    vim.fn.feedkeys("i")
  end
end

function M.make_project()
  if term_bufnum and vim.api.nvim_buf_is_valid(term_bufnum) then
    if term_winid and vim.api.nvim_win_is_valid(term_winid) then
      vim.api.nvim_set_current_win(term_winid)
      vim.fn.feedkeys("i")
      vim.fn.execute("!make install prefix=$HOME/.local")
    else
      vim.cmd("9split")
      term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_winid, term_bufnum)
      vim.fn.feedkeys("i")
      vim.fn.execute("!make install prefix=$HOME/.local")
    end
  else
    vim.cmd("9split")
    term_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    term_bufnum = vim.api.nvim_get_current_buf()
    vim.fn.feedkeys("i")
    vim.fn.execute("!make install prefix=$HOME/.local")
  end
end

return M
