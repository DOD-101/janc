local lang = {
	lang = "html",
	formatter = { "prettier" },
	treesitter = "html",
	linters = { "biomejs" },
	pattern = { "*.html", "*.css", "*.js", "*.scss", "*.sass" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		require("langs.install").ensure_installed("emmet_language_server", function()
			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.emmet_language_server.setup({
				capabilities = lsp_capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"pug",
					"typescriptreact",
				},
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
