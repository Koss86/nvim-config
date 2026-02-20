local M = {
  term_bufnum = nil,
  term_winid = nil,
  clr_term = nil,
}
-- Check if the terminal is still running
local function is_term_active(bufNum)
  if not bufNum or not vim.api.nvim_buf_is_valid(bufNum) then
    return false
  end
  local job_id = vim.bo[bufNum].channel
  return vim.fn.jobwait({ job_id }, 0)[1] == -1
end

local function open_split_term()
  if not (is_term_active(M.term_bufnum)) then
    -- If no terminal is active.
    vim.cmd("9split | terminal")
    M.term_winid = vim.api.nvim_get_current_win()
    M.term_bufnum = vim.api.nvim_get_current_buf()
    M.clr_term = false
    return
  elseif not (M.term_winid and vim.api.nvim_win_is_valid(M.term_winid)) then
    -- If a terminal is active but not open.
    vim.cmd("9split")
    M.term_winid = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(M.term_winid, M.term_bufnum)
  else
    -- If terminal is active & open.
    vim.api.nvim_set_current_win(M.term_winid)
  end

  M.clr_term = true
end

-- Toggle terminal in a split window.
function M.toggle_split_term()
  if is_term_active(M.term_bufnum) then
    if M.term_winid and vim.api.nvim_win_is_valid(M.term_winid) then
      -- If active and open.
      vim.api.nvim_win_close(M.term_winid, true)
      M.term_winid = nil
      return
    else
      -- If active but not open.
      vim.cmd("9split")
      M.term_winid = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(M.term_winid, M.term_bufnum)
    end
  else
    -- If no terminal is active or open.
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

  -- Setup 'cmd' based off filetype.
  if ft == "c" then
    bin = vim.fn.expand("%:t")
    bin = string.sub(bin, 1, -3)
    cmd = string.format("gcc -g -Wall -I. -o %s %s", bin, file_path)
  elseif ft == "odin" then
    local file_dir = vim.fn.expand("%:h")
    cmd = string.format("odin run %s -debug", file_dir)
  elseif ft == "zig" then
    cmd = string.format("zig build-exe %s", file_path)
  elseif ft == "go" then
    cmd = string.format("go build %s", file_path)
  elseif ft == "sh" then
    cmd = string.format("bash %s", file_path)
  else
    print("Filetype not supported:", ft)
    return
  end

  open_split_term()

  local job_id = vim.bo[M.term_bufnum].channel

  if M.clr_term then
    vim.fn.chansend(job_id, "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
  end

  vim.fn.chansend(job_id, cmd .. "\n")

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

  open_split_term()

  local job_id = vim.bo[M.term_bufnum].channel

  if M.clr_term then
    vim.fn.chansend(job_id, "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
  end

  vim.fn.chansend(job_id, cmd .. "\n")

  vim.defer_fn(function()
    vim.fn.feedkeys("i")
  end, 10)
end

-- Open lazygit. Tap q twice to exit.
function M.open_lazy_git()
  vim.cmd("enew | terminal lazygit")
  vim.defer_fn(function()
    vim.fn.feedkeys("i")
  end, 10)
end

return M
