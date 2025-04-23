vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)

-- ####### Custom Functions #######
function CloseAllBuffersInTab()
	local tabpage = vim.api.nvim_get_current_tabpage()
	local tab_buffers = vim.fn.tabpagebuflist(tabpage)
	for _, buf in ipairs(tab_buffers) do
		if vim.api.nvim_buf_is_valid(buf) then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end

require("configs.autocmds")
require("configs.dap")

_G.last_keys = ""

vim.on_key(function(key)
	if vim.fn.mode() == "i" then
		return
	end

	local max_len = 10
	_G.last_keys = (_G.last_keys .. key):sub(-max_len)

	vim.schedule(function()
		vim.cmd.redrawstatus()
	end)
end, vim.api.nvim_create_namespace("keylog_statusline"))
vim.opt.shiftwidth = 4
