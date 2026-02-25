--- What toolchain to use for js/ts development
---@type nil | "deno"
local toolchain = vim.env.JANC_JS_TOOLCHAIN

---@type Lang
local js = {
	name = "javascript",
	formatters = {},
	lsps = { "vtsls" },
	linters = {},
	patterns = { "*.js" },
}

if toolchain == "deno" then
	table.insert(js.lsps, "denols")
	table.insert(js.linters, "deno")
else
	table.insert(js.formatters, "biome")
	table.insert(js.linters, "biomejs")
end

---@type Lang
local ts = vim.tbl_deep_extend("force", js, {
	name = "typescript",
	lsps = { unpack(js.lsps), "ts_ls" },
	patterns = { "*.ts" },
})

return { js, ts }
