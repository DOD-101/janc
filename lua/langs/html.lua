---@type Lang
local lang = {
	names = { "html" },
	formatters = { "prettier" },
	lsps = {
		{
			name = "emmet_language_server",
			settings = {},
		},
	},
	linters = { "biomejs", "htmlhint" },
	patterns = { "*.html" },
}

return lang
