local lang = {
	lang = "sh",
	formatter = { "shfmt" },
	treesitter = "bash",
	linters = { "" },
	pattern = "*.sh",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		require("langs.install").ensure_installed("bashls", function()
			local lspconfig = require("lspconfig")

			lspconfig.bashls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "sh" },
			})
		end)
	end,
})

return lang
