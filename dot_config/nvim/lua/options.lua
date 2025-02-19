require "nvchad.options"

-- add yours here!

local o = vim.o

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

vim.cmd[[set wrap!]]
vim.cmd[[set rnu]]
vim.cmd[[set shiftwidth=4]]

vim.cmd[[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- o.cursorlineopt ='both' -- to enable cursorline!
