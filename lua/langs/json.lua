---@class Lang
local lang = {
	name = "json",
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
	pattern = { "*.json" },
}

return lang
