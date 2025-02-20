---@class Lang
local lang = {
	names = { "json", "jsonc" },
	formatters = { "biome" },
	linters = { "biomejs" },
	lsps = {
		{
			name = "jsonls",
			settings = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	patterns = { "*.json", "*.jsonc" },
}

return lang
