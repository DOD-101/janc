---@type Lang
local lang = {
	names = { "javascript" },
	formatters = { "biome" },
	lsps = {
		{
			name = "vtsls",
			settings = {},
		},
	},
	linters = { "biomejs" },
	patterns = { "*.js" },
}

return lang
