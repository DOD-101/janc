---@type Lang
local lang = {
	names = { "html" },
	formatters = { "prettier" },
	lsps = {
		"emmet_language_server",
		"tailwindcss",
	},
	linters = { "biomejs", "htmlhint" },
	patterns = { "*.html" },
}

return lang
