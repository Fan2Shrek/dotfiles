return {
	keymap = {
		preset = "default",
		["<Enter>"] = { "accept", "fallback" },
		["<tab>"] = { "select_next", "fallback" },
		["<S-tab>"] = { "select_prev", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = {
			auto_show = true,
			window = {
				border = "rounded",
			},
		},
		menu = {
			border = "rounded",
			draw = {
				components = {
					kind_icon = {
						text = function(ctx)
							local icon = ctx.kind_icon
							if ctx.item.source_name == "LSP" then
								local color_item =
									require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
								if color_item and color_item.abbr ~= "" then
									icon = color_item.abbr
								end
							end

							return icon .. ctx.icon_gap
						end,
						highlight = function(ctx)
							local highlight = "BlinkCmpKind" .. ctx.kind
							if ctx.item.source_name == "LSP" then
								local color_item =
									require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
								if color_item and color_item.abbr_hl_group then
									highlight = color_item.abbr_hl_group
								end
							end

							return highlight
						end,
					},
				},
			},
		},
	},

	signature = {
		enabled = true,
		window = {
			border = "rounded",
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
}
