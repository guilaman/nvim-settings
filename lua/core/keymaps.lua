vim.opt.cursorline = true
vim.opt.showcmd = true

vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- \m to clear search
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Ctrl+h or l to switch split to left or right
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Ctrl+k or j to scroll half a page up or down more easily than Ctrl+u or b
vim.keymap.set('n', '<c-k>', '<c-u>')
vim.keymap.set('n', '<c-j>', '<c-d>')
