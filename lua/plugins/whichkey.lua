return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	---@type wk.Opts
	opts = {
		preset = "helix",
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Keymaps [which-key]",
		},
	},
}
