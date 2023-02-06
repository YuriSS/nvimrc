local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.cmd [[ let $FZF_DEFAULT_COMMAND="rg --files" ]]
keymap('n', '<C-p>', ':Files<CR>', opts)
keymap('n', 'R', ':Rg<CR>', opts)
