---@type Lang
local lang = {
	names = { "python" },
	lsps = {
		{
			name = "basedpyright",
			settings = {
				inlayHints = {
					variableTypes = true,
					callArgumentNames = true,
					functionReturnTypes = true,
					genericTypes = true,
				},
			},
		},
	},
	formatters = { "black" },
	linters = { "pylint" },
	patterns = { "*.py" },
}

return lang
