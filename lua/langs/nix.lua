---@type Lang
local lang = {
	names = { "nix" },
	formatters = { "nixfmt" },
	lsps = {
		"nixd",
		"nil_ls",
	},
	patterns = { "*.nix" },
	tabsize = 2,
}

return lang
