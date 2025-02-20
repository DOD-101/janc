---@type Lang
local lang = {
	names = { "yaml" },
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
	patterns = { "*.yml" },
}

return lang
