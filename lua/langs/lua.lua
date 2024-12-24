---@type Lang
local lang = {
	name = "lua",
	formatters = { "stylua" },
	linters = { "luacheck" },
	lsps = {
		{
			name = "lua_ls",
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = {
						enable = false,
					},
				},
			},
		},
	},
	pattern = { "*.lua" },
}

return lang
