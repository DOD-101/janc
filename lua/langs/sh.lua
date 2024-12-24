---@type Lang
local lang = {
	name = "sh",
	formatters = { "shfmt" },
	lsps = {
		{
			name = "bashls",
			settings = {},
		},
	},
	treesitter = "bash",
	pattern = { "*.sh" },
}

return lang
