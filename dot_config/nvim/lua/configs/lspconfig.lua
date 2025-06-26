-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

local servers = {
	html = {},

	intelephense = {
		on_attach = function(client, bufnr)
			client.server_capabilities.signatureHelpProvider = false
		end,
		settings = {
			intelephense = {
				environment = {
					includePaths = {
						vim.fn.expand("~/.local/share/intelephense-stubs"),
					},
				},
			},
		},
	},
}

-- lsps with default config
for name, opts in pairs(servers) do
	opts.on_attach = opts.on_attach or nvlsp.on_attach
	opts.on_init = opts.on_init or nvlsp.on_init
	opts.capabilities = opts.capabilities or nvlsp.capabilities

	lspconfig[name].setup(opts)
end

lspconfig.ts_ls.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/home/pierr/.npm-global/lib/node_modules/@vue/language-server",
				languages = { "vue" },
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
