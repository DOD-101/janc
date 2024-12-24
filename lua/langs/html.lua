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
	linters = { "biomejs", "htmlhint" },
	pattern = { "*.html" },
}

return lang
