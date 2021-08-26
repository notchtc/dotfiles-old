-- Remove trailing whitespaces and newlines when saving
-- Enable rasi highlighting
vim.api.nvim_exec([[
au BufWritePre * %s/\s\+$//e
au BufWritePre * %s/\n\+\%$//e
au BufNewFile,BufRead /*.rasi setf css
]], false)

-- We can write to the shada file now
vim.opt.shadafile = ""
