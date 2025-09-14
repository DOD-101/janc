---@type Lang
local lang = {
	names = { "nix" },
	formatters = { "nixfmt" },
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
							-- luacheck: ignore 631
							expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.nix101-0.options.home-manager.users.value.david',
						},
					},
				},
			},
		},
		{
			name = "nil_ls",
			settings = {},
		},
	},
	patterns = { "*.nix" },
	tabsize = 2,
}

return lang
