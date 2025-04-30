M = {}
local win_id = nil
local buf_id = nil

function M.toggle()
  if buf_id and vim.api.nvim_buf_is_valid(buf_id) then
    if win_id and vim.api.nvim_win_is_valid(win_id) then
      vim.api.nvim_win_close(win_id, true)
      win_id = nil
  else
    vim.cmd("7split")
    win_id = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win_id, buf_id)
    end
  else
    vim.cmd("7split")
    win_id = vim.api.nvim_get_current_win()
    vim.cmd("terminal")
    buf_id = vim.api.nvim_get_current_buf()
  end
end

return M
