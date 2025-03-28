local current_dir = vim.fn.expand('%:p:h')
package.path = current_dir .. '/?.lua;' .. package.path
require("nvchad.default_mapping")

-- add yours here
local map = vim.keymap.set

map("i", "jk", "<ESC>")

map(
	"n",
	"<leader>kw",
	":lua CloseAllBuffersInTab()<CR>",
	{ noremap = true, silent = true, desc = "Close all buffers in tab" }
)


-- LSP mappings
map("n", "<leader>ra", "<Cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc = "Rename" })
