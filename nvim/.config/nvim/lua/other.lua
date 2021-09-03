local cmd = vim.cmd

-- Remove trailing whitespaces and newlines when saving
cmd [[ au BufWritePre * %s/\s\+$//e ]]
cmd [[ au BufWritePre * %s/\n\+\%$//e ]]

-- We can write to the shada file now
vim.opt.shadafile = ""
