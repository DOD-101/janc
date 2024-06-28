local lang = {
	lang = "python",
	formatter = { "black" },
	treesitter = "python",
	linters = { "pylint" },
	pattern = "*.py",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		require("langs.install").ensure_installed("pyright", function()
			local lspconfig = require("lspconfig")

			lspconfig.pyright.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "python" },
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
