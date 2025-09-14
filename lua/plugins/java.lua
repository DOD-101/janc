---@module "lazy"
---@type LazyPluginSpec
return {
	"nvim-java/nvim-java",
	lazy = true,
	ft = "java",
	---@module "java"
	---@type java.Config
	opts = { jdk = { auto_install = false } },
	-- setup = function()
	-- 	require("java").setup()
	-- end,
}
