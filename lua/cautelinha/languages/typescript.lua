local safe_require = require("cautelinha.utils.safe_require")
local ok_dap, dap = safe_require("dap")
local ok_dap_utils, dap_utils = safe_require("dap.utils")
local ok_dap_vscode_js, dap_vscode_js = safe_require("dap-vscode-js")

if not (ok_dap and ok_dap_utils and ok_dap_vscode_js) then
  return
end

dap_vscode_js.setup({
  node_path = "node",
  debugger_path = os.getenv("HOME") .. "/workspace/tests/vscode-js-debug",
  adapters = {'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' },
})

local exts = {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
}

for i, ext in ipairs(exts) do
  dap.configurations[ext] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node)",
      cwd = vim.fn.getcwd(),
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node with ts-node)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "--loader", "ts-node/esm" },
      runtimeExecutable = "node",
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node with deno)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "run", "--inspect-brk", "--allow-all", "${file}" },
      runtimeExecutable = "deno",
      attachSimplePort = 9230,
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Test Current File (pwa-node with jest)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
      runtimeExecutable = "node",
      args = { "${file}", "--coverage", "false" },
      rootPath = "${workspaceFolder}",
      sourceMaps = true,
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Test Current File (pwa-node with vitest)",
      cwd = vim.fn.getcwd(),
      program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
      args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
      autoAttachChildProcesses = true,
      smartStep = true,
      console = "integratedTerminal",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Test Current File (pwa-node with deno)",
      cwd = vim.fn.getcwd(),
      runtimeArgs = { "test", "--inspect-brk", "--allow-all", "${file}" },
      runtimeExecutable = "deno",
      smartStep = true,
      console = "integratedTerminal",
      attachSimplePort = 9230,
    },
    {
      -- use nvim-dap-vscode-js's pwa-chrome debug adapter
      type = "pwa-chrome",
      request = "launch",
      -- name of the debug action
      name = "Launch Chrome to debug client side code",
      -- default vite dev server url
      url = "http://localhost:3000",
      -- for TypeScript/Svelte
      sourceMaps = true,
      webRoot = "${workspaceFolder}/src",
      protocol = "inspector",
      port = 9222,
    },
    -- {
    --   type = "node2",
    --   request = "attach",
    --   name = "Attach Program (Node2)",
    --   processId = dap_utils.pick_process,
    -- },
    -- {
    --   type = "node2",
    --   request = "attach",
    --   name = "Attach Program (Node2 with ts-node)",
    --   cwd = vim.fn.getcwd(),
    --   sourceMaps = true,
    --   skipFiles = { "<node_internals>/**" },
    --   port = 9229,
    -- },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach Program (pwa-node, select pid)",
      cwd = vim.fn.getcwd(),
      processId = dap_utils.pick_process,
      skipFiles = { "<node_internals>/**" },
    },
  }
end
