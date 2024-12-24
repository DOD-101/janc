-- TODO: Once https://github.com/denoland/deno/issues/19728 is fixed add deno fmt as a formatter

---@type Lang
local lang = {
	name = "markdown",
	lsps = {
		{
			name = "marksman",
			settings = {},
		},
	},
	formatters = {},
	pattern = { "*.md" },
}

return lang
