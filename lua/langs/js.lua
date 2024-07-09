local lang = {
	lang = "javascript",
	formatter = { "biome" },
	treesitter = "javascript",
	linters = { "biomejs" },
	pattern = "*.js",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		require("langs.install").ensure_installed("vtsls", function()
			local lspconfig = require("lspconfig")

			lspconfig.vtsls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "javascript" },
			})
		end)
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = lang.pattern,
	once = false,
	callback = function()
		require("lint").try_lint(lang.linters)
	end,
})

return lang
