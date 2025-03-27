local dap = require("dap")

-- dap.adapters.php = {
-- 	type = "executable",
-- 	command = "node",
-- 	args = { os.getenv("HOME") .. "/neovim/vscode-php-debug/out/phpDebug.js" },
-- }
--
dap.adapters.php = {
	type = "executable",
	command = "php-debug-adapter",
	args = {},
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug",
		port = 9003,
		pathMappings = {
			["/srv"] = vim.fn.getcwd(), -- Map Docker paths to local
		},
	},
}

vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Start/Continue" })
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end, { desc = "Open REPL" })
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end, { desc = "Run Last" })

local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set("n", "<leader>du", function()
	dapui.toggle()
end, { noremap = true, silent = true, desc = "Toggle Dap-ui" })
