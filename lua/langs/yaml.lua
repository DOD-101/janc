---@type Lang
local lang = {
	name = "yaml",
	lsps = {
		{
			name = "yamlls",
			settings = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	linters = { "yamllint", "actionlint" },
	formatters = { "prettier" },
	pattern = { "*.yml" },
}

return lang
