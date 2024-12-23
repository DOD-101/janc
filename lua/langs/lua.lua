---@type Lang
local lang = {
	lang = "lua",
	formatter = { "stylua" },
	treesitter = "lua",
	filetype = "lua",
	linters = { "luacheck" },
	lsp = {
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
	pattern = { "*.lua" },
}

return lang
