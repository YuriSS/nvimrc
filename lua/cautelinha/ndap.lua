local dap = require('dap')
local M = {}

function M.debug_jest(file_name)
  local file = vim.api.nvim_buf_get_name(0) or file_name
  dap.run({
    type = 'node2',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    runtimeArgs = {'--inspect-bkr', '/home/yuri/.nvm/versions/node/v16.14.2/bin/jest', '--no-coverage', '--', file},
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
    console = 'integratedTerminal',
    port = 9229,
  })
end

function M.attach()
  dap.run({
    type = 'node2',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
  })
end

return M
