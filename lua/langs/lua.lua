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
	pattern = { "*.lua" },
}

return lang
