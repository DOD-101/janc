---@type Lang
local lang = {
	lang = "html",
	formatters = { "prettier" },
	treesitter = "html",
	lsps = {
		{
			name = "emmet_language_server",
			settings = {},
		},
	},
	linters = { "biomejs" },
	pattern = { "*.html" },
}

return lang
