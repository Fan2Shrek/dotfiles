vim.api.nvim_create_autocmd("BufDelete", {
	callback = function()
		local bufs = vim.t.bufs
		if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
			Snacks.dashboard({ example = "advanced" })
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		require("nvim-tree.api").tree.close()
	end,
})
