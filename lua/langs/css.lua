local lang = {
	lang = "css",
	formatter = { "stylelint", "prettier" },
	treesitter = "css",
	linters = { "" },
	pattern = { "*.css", ".scss" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		require("langs.install").ensure_installed("stylelint_lsp", function()
			local lspconfig = require("lspconfig")
			lspconfig.stylelint_lsp.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "css", "scss" },
			})
		end)
	end,
})

return lang
