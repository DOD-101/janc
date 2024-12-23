---@type Lang
local lang = {
	lang = "hypr",
	formatters = {},
	treesitter = "hyprlang",
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
