local plugin = {
	"airblade/vim-gitgutter",
	config = function()
		vim.cmd("GitGutterSignsDisable")
		vim.cmd("GitGutterLineNrHighlightsEnable")
	end,
}

return plugin
