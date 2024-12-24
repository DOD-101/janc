---@type Lang
local lang = {
	name = "hyprlang",
	formatters = {},
	lsps = {
		{
			name = "hyprls",
			settings = {},
		},
	},
	pattern = { "*.conf" },
}

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

return lang
