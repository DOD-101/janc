---@type Lang
local lang = {
	names = { "javascript", "typescript" },
	formatters = { "biome" },
	lsps = {
		{
			name = "vtsls",
			settings = {
				typescript = {
					inlayHints = {
						parameterNames = { enabled = "literals" },
						parameterTypes = { enabled = true },
						variableTypes = { enabled = true },
						propertyDeclarationTypes = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
						enumMemberValues = { enabled = true },
					},
				},
			},
		},
		{
			name = "ts_ls",
			settings = {},
		},
	},
	linters = { "biomejs" },
	patterns = { "*.js", "*.ts" },
}

return lang
