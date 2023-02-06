local marks = require('cautelinha.marks')
local notes = require('cautelinha.notes')
local jumper = require('cautelinha.jump_shortcuts')
local jester = require('jester')

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

keymap('n', '<leader>N', ':!notetaker<Enter>')
vim.api.nvim_set_keymap('n', '<leader>n', '', { callback = function () notes.take_note() end })
vim.api.nvim_set_keymap('n', '<leader>nl', '', { callback = function () notes.read_last_note() end })

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

vim.api.nvim_set_keymap('n', '<leader>q', '', { callback = function() jumper.jump_to_file() end })
vim.api.nvim_set_keymap('n', '<leader>w', '', { callback = function() jumper.jump_to_test() end })
vim.api.nvim_set_keymap('n', '<leader>e', '', { callback = function() jumper.jump_to_ispec() end })
vim.api.nvim_set_keymap('n', '<leader>r', '', { callback = function() jumper.jump_to_type() end })
vim.api.nvim_set_keymap('n', '<leader>t', '', { callback = function() jumper.jump_to_model() end })

vim.api.nvim_set_keymap('n', '<leader>z', '', { callback = function() jester.run() end })
