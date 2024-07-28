local plugin = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		"BurntSushi/ripgrep",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "%.git/.*" },
				layout_config = {
					horizontal = {
						width = 0.8,
						preview_width = 0.5,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					follow = true,
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}

return plugin
