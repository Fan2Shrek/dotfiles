local lsp = vim.lsp

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

local servers = {
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
	opts.capabilities = capabilities

	lsp.config(name, opts)
	lsp.enable(name)
end

-- lsp.config('ts_ls', {
-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
-- })
