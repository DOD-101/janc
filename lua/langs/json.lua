---@type Lang
local json = {
	name = "json",
	formatters = { "biome" },
	linters = { "biomejs" },
	lsps = { "jsonls" },
	patterns = { "*.json" },
}

---@type Lang
local jsonc = vim.tbl_deep_extend("force", json, {
	name = "jsonc",
	patterns = { "*.jsonc" },
})

return { json, jsonc }
