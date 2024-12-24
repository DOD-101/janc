---@type Lang
local lang = {
	name = "python",
	lsps = {
		{
			name = "pyright",
			settings = {},
		},
	},
	formatters = { "black" },
	linters = { "pylint" },
	pattern = { "*.py" },
}

return lang
