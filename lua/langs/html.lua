---@type Lang
local lang = {
	name = "html",
	formatters = { "prettier" },
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
