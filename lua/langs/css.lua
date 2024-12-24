---@type Lang
local lang = {
	name = "css",
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
	pattern = { "*.css", "*.scss" },
	tabsize = 2,
}

return lang
