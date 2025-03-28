-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "doomchad",
	transparency = true,
}

M.ui = {
	statusline = {
		theme = "vscode_colored",
		order = {
			"mode",
			"file",
			"git",
			"%=",
			"customText",
			"%=",
			"diagnostics",
			"lsp",
			"cwd",
			"cursor",
		},
		modules = {
			customText = function()
				return " " .. os.getenv("USER") .. " -  " .. os.date("%H:%M")
			end,
			cursor = function()
				return "%#StText#%#St_pos_icon#%#St_pos_text# %l:%c"
			end,
		},
	},

	tabufline = {
		lazyload = false,
	},
}

M.term = {
	float = {
		relative = "editor",
		row = 0.25,
		col = 0.25,
		height = 0.5,
		width = 0.5,
		border = "double",
	},
}

return M
