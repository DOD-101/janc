---@type Lang
local lang = {
	names = { "askama" },
	lsps = {},
	formatters = {},
	tabsize = 2,
	treesitter = "jinja",
	patterns = { "*.askama" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = lang.patterns,
	callback = function()
		vim.cmd("setlocal filetype=jinja")
	end,
})

return lang
