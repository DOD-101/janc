---@type Lang
local lang = {
	name = "sh",
	formatters = { "shfmt" },
	lsps = { "bashls" },
	treesitter = "bash",
	patterns = { "*.sh" },
}

return lang
