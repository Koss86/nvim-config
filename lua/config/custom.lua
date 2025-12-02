local M = {
  term_bufnum = nil,
  term_winid = nil,
}

-- Checks if the terminal is still running
local function is_term_active(bufNum)
  if not bufNum or not vim.api.nvim_buf_is_valid(bufNum) then
    return false
  end
  local ok, job_id = pcall(vim.api.nvim_buf_get_var, bufNum, "terminal_job_id")
  if not ok or not job_id then
    return false
  end
  return vim.fn.jobwait({ job_id }, 0)[1] == -1
end

-- Toggle terminal in a split window.
function M.toggleSplitTerm()
  if M.term_bufnum and vim.api.nvim_buf_is_valid(M.term_bufnum) then
    if M.term_winid and vim.api.nvim_win_is_valid(M.term_winid) then
      vim.api.nvim_win_close(M.term_winid, true)
      M.term_winid = nil
      return
    else
      vim.cmd("9split")
      M.term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(M.term_winid, M.term_bufnum)
    end
  else
    vim.cmd("9split | terminal")
    M.term_winid = vim.api.nvim_get_current_win()
    M.term_bufnum = vim.api.nvim_get_current_buf()
  end
  vim.defer_fn(function()
    vim.fn.feedkeys("i")
  end, 10)
end

-- Compile file (c, odin, zig, go)
function M.compile()
  local file_path = vim.fn.expand("%:p")
  local ft = vim.bo.filetype
  local bin
  local cmd

  if ft == "c" then
    bin = vim.fn.expand("%:t")
    bin = string.sub(bin, 1, -3)
    cmd = string.format("gcc -g -Wall -I. -o %s %s", bin, file_path)
  elseif ft == "odin" then
    local dir_path = vim.fn.expand("%:h")
    cmd = string.format("odin run %s -debug", dir_path)
  elseif ft == "zig" then
    cmd = string.format("zig build-exe %s", file_path)
  elseif ft == "go" then
    cmd = string.format("go build %s", file_path)
  else
    print("Filetype not supported:", ft)
    return
  end

  if not (is_term_active(M.term_bufnum)) then
    vim.cmd("9split | terminal")
    M.term_winid = vim.api.nvim_get_current_win()
    M.term_bufnum = vim.api.nvim_get_current_buf()
  elseif not (M.term_winid and vim.api.nvim_win_is_valid(M.term_winid)) then
    vim.cmd("9split")
    M.term_winid = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(M.term_winid, M.term_bufnum)
  else
    vim.api.nvim_set_current_win(M.term_winid)
  end

  local ok, job_id =
    pcall(vim.api.nvim_buf_get_var, M.term_bufnum, "terminal_job_id")

  if ok and job_id then
    vim.fn.chansend(job_id, "\nclear\n")
    vim.fn.chansend(job_id, cmd .. "\n")
  else
    vim.cmd("9split | terminal")
    M.term_winid = vim.api.nvim_get_current_win()
    M.term_bufnum = vim.api.nvim_get_current_buf()
    job_id = vim.b.terminal_job_id
    vim.fn.chansend(job_id, "\nclear\n")
    vim.fn.chansend(job_id, cmd .. "\n")
  end

    if ft == "c" then
        vim.fn.chansend(job_id, "./" .. bin .. "\n")
    end

  vim.defer_fn(function()
    vim.fn.feedkeys("i")
  end, 10)
end

-- Build Project(specific to my Tokyobash project)
function M.make_project()
  local cmd = "make install prefix=$HOME/.local"
  if not (is_term_active(M.term_bufnum)) then
    vim.cmd("9split | terminal")
    M.term_winid = vim.api.nvim_get_current_win()
    M.term_bufnum = vim.api.nvim_get_current_buf()
  elseif not (M.term_winid and vim.api.nvim_win_is_valid(M.term_winid)) then
    vim.cmd("9split")
    M.term_winid = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(M.term_winid, M.term_bufnum)
  else
    vim.api.nvim_set_current_win(M.term_winid)
  end

  local ok, job_id =
    pcall(vim.api.nvim_buf_get_var, M.term_bufnum, "terminal_job_id")
  if ok and job_id then
    vim.fn.chansend(job_id, "\nclear\n")
    vim.fn.chansend(job_id, cmd .. "\n")
  else
    vim.cmd("9split | terminal")
    M.term_winid = vim.api.nvim_get_current_win()
    M.term_bufnum = vim.api.nvim_get_current_buf()
    local new_job_id = vim.b.terminal_job_id
    vim.fn.chansend(new_job_id, "\nclear\n")
    vim.fn.chansend(new_job_id, cmd .. "\n")
  end
  vim.defer_fn(function()
    vim.fn.feedkeys("i")
  end, 10)
end

-- Open lazygit. Tap q twice to exit.
function M.openLazyGit()
  vim.cmd("enew | terminal lazygit")
  vim.defer_fn(function()
    vim.fn.feedkeys("i")
  end, 10)
end

return M
