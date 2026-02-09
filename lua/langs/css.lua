---@type Lang
local lang = {
	names = { "css", "scss" },
	formatters = { "stylelint", "prettier" },
	lsps = {
		"stylelint_lsp",
		"cssls",
		"tailwindcss",
	},
	patterns = { "*.css", "*.scss" },
	tabsize = 2,
}

return lang
