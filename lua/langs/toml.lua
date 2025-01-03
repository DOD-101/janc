---@type Lang
local lang = {
	name = "toml",
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
	pattern = { "*.toml" },
}

return lang
