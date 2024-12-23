---@type Lang
local lang = {
	lang = "lua",
	formatters = { "stylua" },
	treesitter = "lua",
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
