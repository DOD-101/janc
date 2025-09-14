---@module "lazy"
---@type LazyPluginSpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {},
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
}
