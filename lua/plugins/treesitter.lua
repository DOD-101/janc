---@module "lazy"
---@type LazyPluginSpec
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
}
