local current_dir = vim.fn.expand('%:p:h')
package.path = current_dir .. '/?.lua;' .. package.path
require("nvchad.default_mapping")

-- add yours here
local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Map to accept Copilot suggestion
map(
	"i",
	"<C-j>",
	'copilot#Accept("<CR>")',
	{ expr = true, silent = true, noremap = true, replace_keycodes = false, desc = "Accept Copilot suggestion" }
)

-- Hop
map("n", "<leader>j", ":HopPattern<CR>", { silent = true, noremap = true, desc = "Hop pattern" })

map(
	"n",
	"<leader>kw",
	":lua CloseAllBuffersInTab()<CR>",
	{ noremap = true, silent = true, desc = "Close all buffers in tab" }
)

-- LSP mappings
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "Go to definition" })
map("n", "<leader>ra", "<Cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc = "Rename" })

