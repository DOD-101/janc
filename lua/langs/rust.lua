local lang = {
	lang = "rust",
	formatter = { "rustfmt" },
	treesitter = "rust",
	linters = { "" },
	pattern = "*.rs",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.pattern,
	once = true,
	callback = function()
		local lspconfig = require("lspconfig")
		lspconfig.rust_analyzer.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			filetypes = { "rust" },
			settings = {
				cargo = {
					buildScripts = {
						enable = true,
					},
				},
				procMacro = {
					enable = true,
				},
				["rust-analyzer"] = {
					checkOnSave = {
						allFeatures = true,
						overrideCommand = {
							"cargo",
							"clippy",
							"--workspace",
							"--message-format=json",
							"--all-targets",
							"--all-features",
						},
					},
				},
			},
		})
	end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = lang.pattern,
-- 	once = false,
-- 	callback = function()
-- 		require("lint").try_lint(lang.linters)
-- 	end,
-- })

return lang
