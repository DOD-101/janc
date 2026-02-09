-- TODO: Once https://github.com/denoland/deno/issues/19728 is fixed add deno fmt as a formatter

---@type Lang
local lang = {
	names = { "markdown" },
	lsps = { "marksman" },
	formatters = {},
	patterns = { "*.md" },
}

return lang
