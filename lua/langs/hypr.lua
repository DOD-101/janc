---@type Lang
local lang = {
	names = { "hyprlang" },
	formatters = {},
	lsps = { "hyprls" },
	patterns = { "*.conf" },
}

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

return lang
