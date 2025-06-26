local current_dir = vim.fn.expand('%:p:h')
package.path = current_dir .. '/?.lua;' .. package.path

-- add yours here
local map = vim.keymap.set

map(
	"n",
	"<leader>kw",
	":lua CloseAllBuffersInTab()<CR>",
	{ noremap = true, silent = true, desc = "Close all buffers in tab" }
)

map('n', '<leader>rr', ':checktime<CR>', { noremap = true })
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- LSP mappings
map("n", "<leader>ra", "<Cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc = "Rename" })

-- Split mappings
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
