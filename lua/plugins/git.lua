local function graph_style()
	if os.getenv("TERM") == "xterm-kitty" then
		return "kitty"
	else
		return "unicode"
	end
end

---@module "lazy.core.plugin"
---@type PluginOpts[]
return {
	{
		"NeogitOrg/neogit",
		lazy = true,
		cmd = { "Neogit", "NeogitCommit", "NeogitLogCurrent", "NeogitResetState" },
		opts = {
			integrations = {
				telescope = true,
				diffview = true,
			},
			graph_style = graph_style(),
		},
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
		},
	},
	{
		"airblade/vim-gitgutter",
		config = function()
			vim.g.gitgutter_map_keys = 0
			vim.cmd("GitGutterSignsDisable")
			vim.cmd("GitGutterLineNrHighlightsEnable")
		end,
	},
}
