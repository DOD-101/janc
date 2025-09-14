return {
	"supermaven-inc/supermaven-nvim",
	lazy = true,
	-- BUG: When running SupermavenStart to load Supermaven if it is already configured to run you get an error message
	cmd = { "SupermavenStart", "SupermavenStop", "SupermavenToggle" },
	opts = {
		keymaps = {
			accept_suggestion = "<S-CR>",
		},
	},
}
