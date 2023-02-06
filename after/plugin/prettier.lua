local keymap = vim.keymap.set

keymap('n', '<leader>py', '<Plug>(Prettier)')

vim.cmd("autocmd BufWritePost *.ts PrettierAsync")
