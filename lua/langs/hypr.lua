---@type Lang
local lang = {
	name = "hyprlang",
	formatters = {},
	lsps = { "hyprls" },
	patterns = { "*.conf" },
}

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

return lang
