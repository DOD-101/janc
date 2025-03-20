---@type Lang
local lang = {
	names = { "html" },
	formatters = { "prettier" },
	lsps = {
		{
			name = "emmet_language_server",
			settings = {},
		},
		{
			name = "tailwindcss",
			settings = {},
		},
	},
	linters = { "biomejs", "htmlhint" },
	patterns = { "*.html" },
}

return lang
