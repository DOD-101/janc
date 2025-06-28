---@type Lang
local lang = {
	names = { "rust" },
	formatters = { "rustfmt" },
	lsps = {
		{
			name = "rust_analyzer",
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
					checkOnSave = true,
					allFeatures = true,
					preferSelf = true,
					inlayHints = {
						implicitDrops = {
							enable = true,
						},
					},
					cargo = {
						features = "all",
					},

					check = {
						command = "clippy",
					},
				},
			},
		},
	},
	patterns = { "*.rs" },
}

require("conform").formatters.rustfmt = {
	command = "cargo fmt",
}

return lang
