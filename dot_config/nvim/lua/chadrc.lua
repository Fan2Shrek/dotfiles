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
			"keys",
			"%=",
			-- "macro",
			-- "%=",
			"lsp",
			"cwd",
			"cursor",
		},
		modules = {
			customText = function()
				return " " .. os.getenv("USER") .. " -  " .. os.date("%H:%M")
			end,
			cursor = function()
				local line = vim.fn.line(".")
				local col = vim.fn.col(".")
				local line_str = string.format("%3d", line)
				local col_str = string.format("%2d", col)
				return "%#StText#%#St_pos_icon#%#St_pos_text# " .. line_str .. ":" .. col_str
			end,
			macro = function()
				local reg = vim.fn.reg_recording()
				if reg ~= "" then
					return "%#StWarningMsg#" .. " REC @" .. reg .. " "
				end
				return ""
			end,
			keys = function()
				if _G.last_keys and _G.last_keys ~= "" then
					return "%#StText#[" .. _G.last_keys .. "]"
				end
				return ""
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
