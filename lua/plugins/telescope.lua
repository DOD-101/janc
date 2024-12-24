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
						["<M-CR>"] = function(prompt_bufnr)
							local action_set = require("telescope.actions.set")
							local action_state = require("telescope.actions.state")

							local picker = action_state.get_current_picker(prompt_bufnr)
							picker.get_selection_window = function(picker, _)
								vim.cmd("vsplit")
								local winnr = vim.api.nvim_get_current_win()

								-- Unbind after using so next instance of the picker acts normally
								picker.get_selection_window = nil
								return winnr
							end

							return action_set.edit(prompt_bufnr, "edit")
						end,
						["<S-M-CR>"] = function(prompt_bufnr)
							local action_set = require("telescope.actions.set")
							local action_state = require("telescope.actions.state")

							local picker = action_state.get_current_picker(prompt_bufnr)
							picker.get_selection_window = function(picker, _)
								vim.cmd("split")
								local winnr = vim.api.nvim_get_current_win()

								-- Unbind after using so next instance of the picker acts normally
								picker.get_selection_window = nil
								return winnr
							end

							return action_set.edit(prompt_bufnr, "edit")
						end,
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
