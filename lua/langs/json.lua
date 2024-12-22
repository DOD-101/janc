local lang = {
	lang = "json",
	formatter = { "biome" },
	treesitter = "json",
	linters = { "biomejs" },
	pattern = "*.json",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		require("langs.install").ensure_installed("jsonls", function()
			local lspconfig = require("lspconfig")

			lspconfig.jsonls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
				filetypes = { "json" },
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
