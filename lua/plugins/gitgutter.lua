local plugin = {
	"airblade/vim-gitgutter",
	config = function()
		vim.g.gitgutter_map_keys = 0
		vim.cmd("GitGutterSignsDisable")
		vim.cmd("GitGutterLineNrHighlightsEnable")
	end,
}

return plugin
