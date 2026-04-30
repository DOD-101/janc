---@module "lazy"
---@type LazyPluginSpec
return {
	"numToStr/Comment.nvim",
	lazy = true,
	event = "InsertEnter",
	---@module "Comment.config"
	---@type CommentConfig
	---@diagnostic disable-next-line: missing-fields
	opts = {
		ignore = "^$",
	},
}
