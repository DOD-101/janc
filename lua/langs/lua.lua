---@type Lang
local lang = {
	name = "lua",
	formatters = { "stylua" },
	linters = { "luacheck" },
	lsps = { "lua_ls" },
	patterns = { "*.lua" },
}

return lang
