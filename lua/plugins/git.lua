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
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signcolumn = false,
			numhl = true,
		},
	},
}
