local plugin = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				file_ignore_patterns = { "%.git/.*", "target" },
				layout_config = {
					horizontal = {
						width = 0.8,
						preview_width = 0.5,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
				},
				mappings = {
					i = {
						["<C-s>"] = actions.cycle_previewers_next,
						["<C-a>"] = actions.cycle_previewers_prev,
						["<M-CR>"] = actions.select_vertical,
						["<S-M-CR>"] = actions.select_horizontal,
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

		require("telescope").load_extension("live_grep_args")
	end,
}

return plugin
