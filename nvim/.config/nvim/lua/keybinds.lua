-- Set the leader key
vim.g.mapleader = ' '

-- Disable arrow keys for moving in normal mode
vim.api.nvim_set_keymap('', '<up>', '', {})
vim.api.nvim_set_keymap('', '<down>', '', {})
vim.api.nvim_set_keymap('', '<left>', '', {})
vim.api.nvim_set_keymap('', '<right>', '', {})

-- Make navigating through splits easier
vim.api.nvim_set_keymap('', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('', '<C-l>', '<C-w>l', {})

-- Make creating splits easier
vim.api.nvim_set_keymap('', '<leader>sv', ':split<cr>', {})
vim.api.nvim_set_keymap('', '<leader>sh', ':vsplit<cr>', {})

-- Go through wrapped lines
vim.api.nvim_set_keymap('', 'j', 'gj', {})
vim.api.nvim_set_keymap('', 'k', 'gk', {})

-- Go to next/previous file
vim.api.nvim_set_keymap('n', '<leader>l', ':wn<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>h', ':wN<cr>', {})

--
-- BARBAR
--

-- Magic buffer-picking mode
vim.api.nvim_set_keymap('n', '<C-s>', ':BufferPick<CR>', {noremap = true, silent = true})
-- Move to previous/next
vim.api.nvim_set_keymap('n', '<A-,>', ':BufferPrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferNext<CR>', {noremap = true, silent = true})
-- Re-order to previous/next
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferMovePrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A->>', ':BufferMoveNext<CR>', {noremap = true, silent = true})
-- Goto buffer in position...
vim.api.nvim_set_keymap('n', '<A-1>', ':BufferGoto 1<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-2>', ':BufferGoto 2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-3>', ':BufferGoto 3<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-4>', ':BufferGoto 4<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-5>', ':BufferGoto 5<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-6>', ':BufferGoto 6<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-7>', ':BufferGoto 7<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-8>', ':BufferGoto 8<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-9>', ':BufferLast<CR>', {noremap = true, silent = true})
-- Close buffer
vim.api.nvim_set_keymap('n', '<A-c>', ':BufferClose<CR>', {noremap = true, silent = true})

-- nvim-tree
-- Toggle visibility of nvim-tree
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<cr>',   {silent = true})
-- Go to the current file in nvim-tree
vim.api.nvim_set_keymap('n', '<leader>N', ':NvimTreeFindFile<cr>', {silent = true})
-- Refresh nvim-tree
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<cr>',  {silent = true})

-- Spell Check
vim.api.nvim_set_keymap('n', '<leader>sp', ':setlocal spell! spelllang=en_us<cr>', {})
