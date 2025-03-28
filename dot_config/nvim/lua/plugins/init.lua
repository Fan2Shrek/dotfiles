return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			renderer = {
				group_empty = true,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
}
