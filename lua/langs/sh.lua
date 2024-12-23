-- TODO: Make sure this works for all shell script files

---@type Lang
local lang = {
	lang = "sh",
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
