local stl = {
    '%#Search#',
    ' %-0.25t ',
    '%#Conceal#',
    '%( %M%)',
    '%( %R%)',
    '%( %W%)',
    '%=',
    ' %{&fileencoding?&fileencoding:&encoding}',
    ' %{&fileformat}',
    ' %(%Y %)',
    '%#Search#',
    ' %l:%c',
    ' %p%% '
}

vim.o.statusline = table.concat(stl)
