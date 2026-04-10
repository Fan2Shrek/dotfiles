return {
	-- {
	--     "williamboman/mason-lspconfig.nvim",
	--     event = "VeryLazy",
	--     opts = {
	--         ensure_installed = { "vuels" },
	--     }
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		branch = 'main',
		lazy = false,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		init = function()
		  vim.api.nvim_create_autocmd('FileType', {
			callback = function()
			  pcall(vim.treesitter.start)
			  vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		  })
		  local ensureInstalled = {
			'lua', 'php', 'typescript',
		  }
		  local alreadyInstalled = require('nvim-treesitter.config').get_installed()
		  local parsersToInstall = vim.iter(ensureInstalled)
			:filter(function(parser)
			  return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		  require('nvim-treesitter').install(parsersToInstall)
		end,
		opts = function()
			return require("configs.treesitter")
		end,
	},
	{ 'wakatime/vim-wakatime', lazy = false },
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
		opts = {},
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = require("configs.noice"),
	-- },
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
		"romgrk/barbar.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = require("configs.barbar"),
	},
	-- {
	-- 	-- remove unlazy load
	-- 	"mfussenegger/nvim-dap",
	-- 	-- lazy = false,
	-- 	config = function() end,
	-- },
	-- {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"nvim-neotest/nvim-nio",
	-- 	},
	-- },
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
			terminal = {
				win = {
					position = "float",
					width = 0.6,
					height = 0.6,
					border = "rounded",
					wo = {
						winhighlight = {
							NormalFloat = "Main",
							FloatBorder = "BlueVariant",
						},
					},
				},
			},
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
	{
		"cocopon/iceberg.vim",
		lazy = false,
		config = function()
			vim.cmd("colorscheme iceberg")
		end,
	},
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
