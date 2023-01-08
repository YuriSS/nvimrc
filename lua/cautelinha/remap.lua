local marks = require('cautelinha.marks')
local notes = require('cautelinha.notes')
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<leader>pv", vim.cmd.Ex)

keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

keymap('n', '<leader>py', '<Plug>(Prettier)')

keymap('n', '<leader>N', ':!notetaker<Enter>')
vim.api.nvim_set_keymap('n', '<leader>n', '', { callback = function () notes.take_note() end })
vim.api.nvim_set_keymap('n', '<leader>rn', '', { callback = function () notes.read_last_note() end })

vim.api.nvim_set_keymap('n', '<leader>mm', '', { callback = function () marks.mark_file() end })
vim.api.nvim_set_keymap('n', '<leader>mr', '', { callback = function () marks.remove_current_file() end })
vim.api.nvim_set_keymap('n', '<leader>ma', '', { callback = function () marks.mark_file(1) end })
vim.api.nvim_set_keymap('n', '<leader>ms', '', { callback = function () marks.mark_file(2) end })
vim.api.nvim_set_keymap('n', '<leader>md', '', { callback = function () marks.mark_file(3) end })
vim.api.nvim_set_keymap('n', '<leader>mf', '', { callback = function () marks.mark_file(4) end })
vim.api.nvim_set_keymap('n', '<leader>a', '', { callback = function () marks.jump_to_marked_file(1) end })
vim.api.nvim_set_keymap('n', '<leader>s', '', { callback = function () marks.jump_to_marked_file(2) end })
vim.api.nvim_set_keymap('n', '<leader>d', '', { callback = function () marks.jump_to_marked_file(3) end })
vim.api.nvim_set_keymap('n', '<leader>f', '', { callback = function () marks.jump_to_marked_file(4) end })
