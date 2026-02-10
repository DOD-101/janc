---@type Lang
local lang = {
	name = "python",
	lsps = { "basedpyright" },
	formatters = { "black" },
	linters = { "pylint" },
	patterns = { "*.py" },
}

return lang
