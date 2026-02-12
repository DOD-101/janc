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

---@module "lazy-nvim"
---@type LazyPluginSpec
local nordic = {
	name = "nordic",
	priority = 1000,
	opts = {},
}

local nordic_dir = vim.env.JANC_NORDIC_DIR

if nordic_dir then
	nordic.dir = nordic_dir
else
	table.insert(nordic, "AlexvZyl/nordic.nvim")
end

return { tokyonight, catppuccin, nordic }
