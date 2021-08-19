vim.opt.shadafile = ""

-- Remove trailing whitespaces and newlines when saving
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])
