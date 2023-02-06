local M = {}

function M.take_note()
  local filename = vim.api.nvim_buf_get_name(0)
  local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local command = "notetaker " .. filename .. ":" .. r
  io.popen(command)
end

function M.read_last_note()
  local command = "tmux display-popup -E 'ls -rd /home/yuri/Documents/notes/src/* | head -n1 | xargs nvim'"
  io.popen(command)
end

return M
