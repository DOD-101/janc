---@class Lang
local lang = {
	lang = "json",
	filetype = "json",
	formatter = { "biome" },
	treesitter = "json",
	linters = { "biomejs" },
	lsp = {
		name = "jsonls",
		settings = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
	pattern = { "*.json" },
}

return lang
