---@type Lang
local lang = {
	lang = "rust",
	formatters = { "rustfmt" },
	treesitter = "rust",
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
	pattern = { "*.rs" },
}

return lang
