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
		local lspconfig = require("lspconfig")

		lspconfig.nixd.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			filetypes = { "nix" },
			settings = {
				nixd = {
					nixpkgs = {
						expr = '(builtins.getFlake ("git+file://" + toString ./.)).inputs.nixpkgs { }',
					},
					formatting = {
						command = { "nixfmt" },
					},
					options = {
						nixos = {
							expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nix101-0.options',
						},
						home_manager = {
							expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nix101-0.options.home-manager.users.value.david',
						},
					},
				},
			},
		})

		vim.lsp.inlay_hint.enable(true)
	end,
})

return lang
