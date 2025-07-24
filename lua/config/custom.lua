local M = {}

local term_bufnum = nil
local term_winid = nil

local git_bufnum = nil
local work_bufnum = nil

function M.toggleSplitTerm()
  if term_bufnum and vim.api.nvim_buf_is_valid(term_bufnum) then
    if term_winid and vim.api.nvim_win_is_valid(term_winid) then
      vim.api.nvim_win_close(term_winid, true)
      term_winid = nil
    else
      vim.cmd("12split")
      term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_winid, term_bufnum)
      vim.fn.feedkeys("i")
    end
  else
    vim.cmd("12split")
    term_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    term_bufnum = vim.api.nvim_get_current_buf()
    vim.fn.feedkeys("i")
  end
end

function M.openLazyGit()
  if git_bufnum and vim.api.nvim_buf_is_valid(git_bufnum) then
    if work_bufnum and vim.api.nvim_buf_is_valid(work_bufnum) then
      -- if in lazygit load work file buf else load lazygit buf.
      if vim.api.nvim_get_current_buf() == git_bufnum then
        vim.api.nvim_win_set_buf(0, work_bufnum)
      else
        work_bufnum = vim.api.nvim_get_current_buf()
        vim.api.nvim_win_set_buf(0, git_bufnum)
        vim.fn.feedkeys("i")
      end
    else
      work_bufnum = vim.api.nvim_get_current_buf()
      vim.api.nvim_win_set_buf(0, git_bufnum)
      vim.fn.feedkeys("i")
    end
  else
    work_bufnum = vim.api.nvim_get_current_buf()
    vim.cmd("enew")
    git_bufnum = vim.api.nvim_get_current_buf()
    vim.cmd("terminal lazygit")
    vim.fn.feedkeys("i")
  end
end

function M.gcc()
  local file_path = vim.fn.expand("%:p")
  if term_bufnum and vim.api.nvim_buf_is_valid(term_bufnum) then
    if term_winid and vim.api.nvim_win_is_valid(term_winid) then
      vim.api.nvim_set_current_win(term_winid)
      vim.fn.execute("!gcc -Og -I. " .. file_path)
      vim.fn.feedkeys("i")
    else
      vim.cmd("12split")
      term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_winid, term_bufnum)
      vim.fn.execute("!gcc -Og -I. " .. file_path)
      vim.fn.feedkeys("i")
    end
  else
    vim.cmd("12split")
    term_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    term_bufnum = vim.api.nvim_get_current_buf()
    vim.fn.execute("!gcc -Og -I. " .. file_path)
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
      vim.cmd("12split")
      term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_winid, term_bufnum)
      vim.fn.execute("!zig build-exe " .. file_path)
      vim.fn.feedkeys("i")
    end
  else
    vim.cmd("12split")
    term_winid = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    term_bufnum = vim.api.nvim_get_current_buf()
    vim.fn.execute("!zig build-exe " .. file_path)
    vim.fn.feedkeys("i")
  end
end

return M
