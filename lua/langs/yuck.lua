---@class Lang
local lang = {
	name = "yuck",
	formatters = { "topiary_yuck" },
	lsps = {},
	linters = {},
	pattern = { "*.yuck" },
	tabsize = 2,
}

require("conform").formatters.topiary_yuck = {
	meta = {
		url = "https://github.com/michaelb/topiary",
		description = "Topiary formatter, configured for yuck.",
	},
	command = "topiary",
	args = { "format", "--language", "yuck" },
	stdin = true,
}

return lang
