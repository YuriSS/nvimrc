local M = {}
local max_files = 4
local marked_files = {}

local function get_marked_file_by_index(index)
  local result = nil
  for key, value in pairs(marked_files) do
    if value == index then
      result = key
      break
    end
  end
  return result
end

local function get_next_index()
  local result = nil
  for i = 1, max_files, 1 do
    if get_marked_file_by_index(i) == nil then
      result = i
      break
    end
  end
  return result
end

local function marked_files_to_string()
  local result = ''
  for file_name, value in pairs(marked_files) do
    result = result .. ':[' .. value .. ']' .. file_name .. '\n'
  end
  return result
end

function M.mark_file(index)
  local next = index or get_next_index()
  if next ~= nil then
    marked_files[vim.api.nvim_buf_get_name(0)] = next
    print('File marked with index ' .. next)
  else
    print('Marked files list is full')
  end
end

function M.list_marked_files()
  print(marked_files_to_string())
end

function M.remove_marked_file(index)
  for file_name, value in pairs(marked_files) do
    if value == index then
      marked_files[file_name] = nil
      print('File with index ' .. index .. ' not marked anymore')
      break
    end
  end
end

function M.remove_current_file()
  local file_name = vim.api.nvim_buf_get_name(0)
  marked_files[file_name] = nil
  print('File not marked anymore')
end

function M.jump_to_marked_file(index)
  local file_name = get_marked_file_by_index(index)
  if file_name then
    local buf_id = vim.fn.bufnr(file_name)
    if vim.api.nvim_buf_is_loaded(buf_id) then
      vim.api.nvim_set_current_buf(buf_id)
    end
  end
end

function M.menu()
  local width = 50
  local height = 10
  local buf = vim.api.nvim_create_buf(false, true)
  local ui = vim.api.nvim_list_uis()[1]
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = (ui.width/2) - (width/2),
    row = (ui.height/2) - (height/2),
    anchor = 'NW',
    style = 'minimal',
  }
  vim.api.nvim_open_win(buf, 1, opts)
  for file_name, offset in pairs(marked_files) do
    vim.api.nvim_buf_set_text(buf, offset, 1, offset, 1, {file_name})
  end
end

return M
