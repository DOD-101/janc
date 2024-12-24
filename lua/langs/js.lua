---@type Lang
local lang = {
	name = "javascript",
	formatters = { "biome" },
	lsps = {
		{
			name = "vtsls",
			settings = {},
		},
	},
	linters = { "biomejs" },
	pattern = { "*.js" },
}

return lang
