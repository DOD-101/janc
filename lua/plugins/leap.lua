return {
	"ggandor/leap.nvim",
	lazy = true,
	event = { "InsertEnter" },
	dependencies = {
		"tpope/vim-repeat",
	},
	config = function()
		require("leap").create_default_mappings()
	end,
}
