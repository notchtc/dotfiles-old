local cmd = vim.cmd

-- Remove trailing whitespaces and newlines when saving
cmd [[ au BufWritePre * %s/\s\+$//e ]]
cmd [[ au BufWritePre * %s/\n\+\%$//e ]]

-- Active statusline
cmd [[ au WinEnter * setlocal statusline=%!luaeval('statusline()') ]]
-- Inactive statusline
cmd [[ au WinLeave * setlocal statusline=%f ]]

-- We can write to the shada file now
vim.opt.shadafile = ""
