-- Remove trailing whitespace and newlines when saving
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

vim.cmd('autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab')
