---@type Lang
local lang = {
	name = "yaml",
	lsps = { "yamlls" },
	linters = { "yamllint", "actionlint" },
	formatters = { "prettier" },
	patterns = { "*.yml" },
}

return lang
