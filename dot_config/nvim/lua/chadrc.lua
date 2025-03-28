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
