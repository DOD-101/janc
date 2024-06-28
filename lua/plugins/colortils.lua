local plugin = {
	"max397574/colortils.nvim",
	cmd = "Colortils",
	config = function()
		require("colortils").setup()
	end,
}

return plugin
