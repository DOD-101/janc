local plugin = {
	"tpope/vim-fugitive",
	dependencies = {
		{
			"rbong/vim-flog",
			lazy = true,
			cmd = { "Flog", "Flogsplit", "Floggit" },
		},
	},
}

return plugin
