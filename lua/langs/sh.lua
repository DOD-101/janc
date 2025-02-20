---@type Lang
local lang = {
	names = { "sh" },
	formatters = { "shfmt" },
	lsps = {
		{
			name = "bashls",
			settings = {},
		},
	},
	treesitter = "bash",
	patterns = { "*.sh" },
}

return lang
