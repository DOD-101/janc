-- TODO: Add support for deno / prettier

---@type Lang
local js = {
	name = "javascript",
	formatters = { "biome" },
	lsps = { "vtsls" },
	linters = { "biomejs" },
	patterns = { "*.js" },
}

---@type Lang
local ts = vim.tbl_deep_extend("force", js, {
	name = "typescript",
	lsps = { unpack(js.lsps), "ts_ls" },
	patterns = { "*.ts" },
})

return { js, ts }
