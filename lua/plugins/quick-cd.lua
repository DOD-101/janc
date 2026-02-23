---@module "lazy"
---@type LazyPluginSpec
return {
	"dod-101/quick-cd",
	dir = vim.env.JANC_QUICK_CD_DIR,
	---@module "quick-cd"
	---@type SetupOpts
	opts = {
		telescope_theme = "dropdown",
	},
}
