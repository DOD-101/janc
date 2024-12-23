---@type Lang
local lang = {
	lang = "python",
	lsps = {
		{
			name = "pyright",
			settings = {},
		},
	},
	formatters = { "black" },
	treesitter = "python",
	linters = { "pylint" },
	pattern = { "*.py" },
}

return lang
