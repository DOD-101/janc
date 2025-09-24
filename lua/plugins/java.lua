---@module "lazy"
---@type LazyPluginSpec
return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	lazy = true,
	config = function()
		require("jdtls")
	end,
}
