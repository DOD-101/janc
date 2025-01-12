local plugin = {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<S-CR>",
				},
			})
		end,
	},
}

return plugin
