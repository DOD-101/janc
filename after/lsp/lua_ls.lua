---@type vim.lsp.Config
return {
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
}
