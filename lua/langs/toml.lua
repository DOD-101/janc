---@type Lang
local lang = {
	names = { "toml" },
	formatters = { "taplo" },
	lsps = {
		{
			name = "taplo",
			settings = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	patterns = { "*.toml" },
}

return lang
