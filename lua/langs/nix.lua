local lang = {
	lang = "nix",
	formatter = { "nixfmt" },
	treesitter = "nix",
	linters = { "" },
	pattern = "*.nix",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		require("langs.install").ensure_installed("nil_ls", function()
			local lspconfig = require("lspconfig")

			lspconfig.nil_ls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "nix" },
			})
		end)
	end,
})

return lang
