---@type Lang
local css = {
	name = "css",
	formatters = { "stylelint", "prettier" },
	lsps = {
		"cssls",
		"stylelint_lsp",
		"tailwindcss",
	},
	patterns = { "*.css" },
	tabsize = 2,
}

---@type Lang
local scss = vim.tbl_deep_extend("force", css, {
	name = "scss",
	patterns = { "*.scss" },
})

return { css, scss }
