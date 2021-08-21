-- Remove trailing whitespaces and newlines when saving
vim.cmd([[au BufWritePre * %s/\s\+$//e]])
vim.cmd([[au BufWritePre * %s/\n\+\%$//e]])
-- Enable .rasi file syntax highlighting
vim.cmd([[au BufNewFile,BufRead /*.rasi setf css]])

-- We can write to the shada file now
vim.opt.shadafile = ""
