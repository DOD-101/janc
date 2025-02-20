---@type Lang
local lang = {
	names = { "python" },
	lsps = {
		{
			name = "pyright",
			settings = {},
		},
	},
	formatters = { "black" },
	linters = { "pylint" },
	patterns = { "*.py" },
}

return lang
