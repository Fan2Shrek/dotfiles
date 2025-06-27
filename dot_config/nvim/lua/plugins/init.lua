return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
	},
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("configs.lspconfig")
		end,
	},
	-- {
	-- 	"saghen/blink.cmp",
	-- 	opts = require("configs.blink"),
	-- },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"https://codeberg.org/FelipeLema/cmp-async-path.git",
			},
		},
		opts = function()
			return require("configs.cmp")
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			render = "foreground",
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_ansi = true,
			enable_hsl_without_function = true,
			enable_var_usage = true,
			enable_named_colors = false,
		},
	},
}
