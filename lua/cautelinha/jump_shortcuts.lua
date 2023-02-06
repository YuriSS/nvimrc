local M = {}

local function remove_last_filename_part(file_name)
  return file_name:match("(.+)%..+$"), file_name:match("^.+(%..+)$")
end

local function file_exists(name)
 local f=io.open(name,"r")
 if f~=nil then
   io.close(f)
   return true
 else return false
 end
end

local function jumper(file_name, error_message)
  if not file_exists(file_name) then
    print(error_message, file_name)
  else
    vim.cmd(":e " .. file_name)
  end
end

local function is_equal_complementary_extension(extension)
  local complementary_extensions = { ".spec", ".ispec", ".model", ".type" }
  for _, complementary_extension in ipairs(complementary_extensions) do
    if complementary_extension == extension then
      return true
    end
  end
  return false
end

local function get_file_name()
  local file_name, original_extension = remove_last_filename_part(vim.api.nvim_buf_get_name(0))
  local next_filename, extension = remove_last_filename_part(file_name)
  if is_equal_complementary_extension(extension) then
    file_name = next_filename
  end
  return file_name, original_extension
end

function M.jump_to_test()
  local file_name, extension = get_file_name()
  jumper(file_name .. ".spec" .. extension, "No test file found")
end

function M.jump_to_type()
  local file_name, extension = get_file_name()
  jumper(file_name .. ".type" .. extension, "No type file found")
end

function M.jump_to_model()
  local file_name, extension = get_file_name()
  jumper(file_name .. ".model" .. extension, "No model file found")
end

function M.jump_to_ispec()
  local file_name, extension = get_file_name()
  jumper(file_name .. ".ispec" .. extension, "No model file found")
end

function M.jump_to_file()
  local file_name, extension = get_file_name()
  jumper(file_name .. extension, "No origin file found")
end

return M
