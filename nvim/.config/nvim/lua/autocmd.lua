vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])