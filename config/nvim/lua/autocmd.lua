-- Remove trailing whitespace and newlines when saving
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

-- Run PackerCompile after editing plugins.lua
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')