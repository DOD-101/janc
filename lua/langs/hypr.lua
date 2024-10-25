local lang = {
	lang = "hypr",
	formatter = {},
	treesitter = "hyprlang",
	linters = {},
	pattern = "*.conf",
}

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		require("langs.install").ensure_installed("hyprls", function()
			local lspconfig = require("lspconfig")

			lspconfig.hyprls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "hyprlang" },
			})
		end)
	end,
})

return lang
