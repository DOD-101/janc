local function open_git_show()
	local action_state = require("telescope.actions.state")
	local selection = action_state.get_selected_entry().value
	vim.cmd("NeogitCommit " .. selection)
	vim.cmd("stopinsert")
end

local function copy_hash_to_clipboard(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local selection = action_state.get_selected_entry()
	local actions = require("telescope.actions")
	vim.fn.setreg("+", selection.value)
	actions.close(prompt_bufnr)
end

return {
	"dod-101/telescope.nvim", -- HACK: Until my PR is merged: https://github.com/nvim-telescope/telescope.nvim/pull/3538
	branch = "fix-diagnostic-config",
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

				git_commits = {
					mappings = {
						i = {
							["<C-CR"] = copy_hash_to_clipboard,
							["<CR>"] = open_git_show,
						},
						n = {

							["<C-CR"] = copy_hash_to_clipboard,
							["<CR>"] = open_git_show,
						},
					},
				},
			},
		})
		require("telescope").load_extension("fzf")

		require("telescope").load_extension("live_grep_args")
	end,
}
