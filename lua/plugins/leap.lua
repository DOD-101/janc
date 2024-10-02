local plugin = {
	"ggandor/leap.nvim",
	dependencies = {
		"tpope/vim-repeat",
	},
	config = function()
		-- require("octo").setup()
		require("leap").create_default_mappings()
	end,
}

return plugin
