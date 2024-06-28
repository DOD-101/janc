local plugin = {
	"yioneko/nvim-vtsls",
	config = function()
		require("vtsls").config({})
	end,
}

return plugin
