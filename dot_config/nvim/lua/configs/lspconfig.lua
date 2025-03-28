-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

local servers = {
	html = {},

	intelephense = {
		on_attach = function(client, bufnr)
            nvlsp.on_attach(client, bufnr)
            vim.keymap.set("n", "gd", "lua Snacks.picker.lsp_definitions()", { noremap = true, silent = true })
			client.server_capabilities.signatureHelpProvider = false
		end,
	},
}

-- lsps with default config
for name, opts in pairs(servers) do
	opts.on_attach = opts.on_attach or nvlsp.on_attach
	opts.on_init = opts.on_init or nvlsp.on_init
	opts.capabilities = opts.capabilities or nvlsp.capabilities

	lspconfig[name].setup(opts)
end
