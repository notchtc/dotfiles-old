-- Remove trailing whitespaces and newlines when saving
cmd [[ au BufWritePre * %s/\s\+$//e ]]
cmd [[ au BufWritePre * %s/\n\+\%$//e ]]

-- Enable rasi highlighting
cmd [[ au BufNewFile,BufRead /*.rasi setf css ]]

-- We can write to the shada file now
vim.opt.shadafile = ""
