---@type Lang
local lang = {
	names = { "css", "scss" },
	formatters = { "stylelint", "prettier" },
	lsps = {
		{
			name = "stylelint_lsp",
			settings = {},
		},
		{
			name = "cssls",
			settings = {},
		},
	},
	patterns = { "*.css", "*.scss" },
	tabsize = 2,
}

return lang
