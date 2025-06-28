---@type Lang
local lang = {
	names = { "html" },
	formatters = { "prettier" },
	lsps = {
		{
			name = "emmet_language_server",
			settings = {},
			filetypes = {
				"html",
				"css",
				"scss",
				"sass",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"markdown",
			},
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
