---@type Lang
local lang = {
	names = { "lua" },
	formatters = { "stylua" },
	linters = { "luacheck" },
	lsps = {
		{
			name = "lua_ls",
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = { vim.env.VIMRUNTIME },
						checkThirdParty = false,
					},
					hint = { enable = true },
					telemetry = {
						enable = false,
					},
				},
			},
		},
	},
	patterns = { "*.lua" },
}

return lang
