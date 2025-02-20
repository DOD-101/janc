---@type Lang
local lang = {
	names = { "hyprlang" },
	formatters = {},
	lsps = {
		{
			name = "hyprls",
			settings = {},
		},
	},
	patterns = { "*.conf" },
}

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

return lang
