---@type Lang
local lang = {
	lang = "css",
	formatters = { "stylelint", "prettier" },
	treesitter = "css",
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
