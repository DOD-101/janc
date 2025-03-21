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
		},
	},
	patterns = { "*.rs" },
}

return lang
