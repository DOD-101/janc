-- TODO: Add support for deno / prettier

---@type Lang
local lang = {
	names = { "javascript", "typescript" },
	formatters = { "biome" },
	lsps = { "vtsls", "ts_ls" },
	linters = { "biomejs" },
	patterns = { "*.js", "*.ts" },
}

return lang
