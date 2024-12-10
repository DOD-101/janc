local lang = {
	lang = "css",
	formatter = { "stylelint", "prettier" },
	treesitter = "css",
	linters = { "" },
	pattern = { "*.css", ".scss" },
	tabsize = 2,
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		local lspconfig = require("lspconfig")
		require("langs.install").ensure_installed("stylelint_lsp", function()
			lspconfig.stylelint_lsp.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "css", "scss" },
			})
		end)

		require("langs.install").ensure_installed("cssls", function()
			lspconfig.cssls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "css", "scss" },
			})
		end)
	end,
})

return lang
