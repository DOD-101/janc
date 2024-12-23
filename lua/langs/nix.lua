---@type Lang
local lang = {
	lang = "nix",
	formatters = { "nixfmt" },
	treesitter = "nix",
	lsps = {
		{
			name = "nixd",
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
		},
	},
	pattern = { "*.nix" },
	tabsize = 2,
}

return lang
