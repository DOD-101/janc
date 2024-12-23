---@type Lang
local lang = {
	lang = "javascript",
	formatters = { "biome" },
	treesitter = "javascript",
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
