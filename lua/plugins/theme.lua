local tokyonight = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
}

local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	---@module 'catppuccin'
	---@type CatppuccinOptions
	opts = {
		float = {
			transparent = false,
			solid = false,
		},
		auto_integrations = true,
	},
}

---@module "lazy"
---@type LazyPluginSpec
local nordic = {
	"AlexvZyl/nordic.nvim",
	dir = vim.env.JANC_NORDIC_DIR,
	name = "nordic",
	priority = 1000,
	opts = {},
}

return { tokyonight, catppuccin, nordic }
