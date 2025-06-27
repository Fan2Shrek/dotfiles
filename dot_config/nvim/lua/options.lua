local o = vim.o

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

o.rnu = true
o.nu = true

o.laststatus = 0
o.signcolumn = "no"
vim.wo.signcolumn = "no"

o.clipboard = "unnamedplus"

vim.opt.laststatus = 0
vim.api.nvim_set_hl(0 , 'Statusline', {link = 'Normal'})
vim.api.nvim_set_hl(0 , 'StatuslineNC', {link = 'Normal'})
local str = string.rep('-', vim.api.nvim_win_get_width(0))
vim.opt.statusline = str
