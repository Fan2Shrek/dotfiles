local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		php = { "php-cs-fixer" },
		css = { "prettier" },
		scss = { "prettier" },
		sass = { "prettier" },
		-- javascript = { "prettier" },
		js = { "prettier", "local_prettier" },
		typescript = { "local_prettier" },
		vue = { "prettier" },

		-- css = { "prettier" },
		-- html = { "prettier" },
	},

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

return options
