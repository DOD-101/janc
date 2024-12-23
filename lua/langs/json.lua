---@class Lang
local lang = {
	lang = "json",
	formatters = { "biome" },
	treesitter = "json",
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
