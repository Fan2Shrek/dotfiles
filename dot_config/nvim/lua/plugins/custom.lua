return {
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	--        cmd = "Telescope",
	-- 	opts = require("configs.telescope"),
	-- },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = { "vuels" },
        }
    },
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.treesitter")
		end,
	},
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},
	{
		"zbirenbaum/copilot.lua",
		commit = "99654fe9ad6cb2500c66b178a03326f75c95f176", -- https://github.com/zbirenbaum/copilot.lua/issues/408
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup(require("configs.copilot"))
		end,
	},
	{
		"smoka7/hop.nvim",
		keys = {
			{
				",",
				function()
					require("hop").hint_words()
				end,
				mode = { "n", "x", "o" },
			},
			{
				"<leader>j",
				function()
					require("hop").hint_patterns()
				end,
			},
			{
				"<leader>kk",
				function()
					require("hop").hint_anywhere()
				end,
			},
		},
		opts = require("configs.hop"),
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
        opts = {},
	},
	{
		"ta-tikoma/php.easy.nvim",
		keys = require("configs.easyphp"),
        opts = {}
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = require("configs.noice"),
	},
	{
		"RRethy/vim-illuminate",
	},
	{
		"cappyzawa/trim.nvim",
		opts = {},
		event = "InsertEnter",
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {},
	},
	{
		-- remove unlazy load
		"mfussenegger/nvim-dap",
		-- lazy = false,
		config = function() end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			dashboard = { example = "advanced" },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			words = { enabled = true },
			picker = {
				win = {
					input = {
						keys = {
							["<Tab>"] = { "list_down", mode = { "i", "n" } },
							["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
						},
					},
					list = {
						keys = {
							["<Tab>"] = "list_down",
							["<S-Tab>"] = "list_up",
							["<S-k>"] = "preview_scroll_up",
							["<S-j>"] = "preview_scroll_down",
						},
					},
				},
			},
		},
		keys = require("configs.snacks"),
	},
}
