---@type Lang
local lang = {
	name = "html",
	formatters = { "prettier" },
	lsps = {
		"emmet_language_server",
		"tailwindcss",
	},
	linters = { "biomejs", "htmlhint" },
	patterns = { "*.html" },
}

return lang
