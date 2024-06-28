local lang = {
	lang = "lua",
	formatter = { "stylua" },
	treesitter = "lua",
	linters = { "luacheck" },
	pattern = "*.lua",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		require("langs.install").ensure_installed("lua_ls", function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "lua" },
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
			})
		end)
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = lang.pattern,
	once = false,
	callback = function()
		require("lint").try_lint(lang.linters)
	end,
})

return lang
