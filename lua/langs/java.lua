---@type Lang
local lang = {
	names = { "java" },
	lsps = {
		{
			name = "jdtls",
			settings = {},
		},
	},
	formatters = { "google-java-format" },
	patterns = { "*.java" },
}

return lang
