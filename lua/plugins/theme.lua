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
		integrations = {
			gitgutter = true,
			blink_cmp = true,
			harpoon = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
				scope_color = "maroon",
			},
			leap = true,
			markdown = true,
		},
	},
}

return { tokyonight, catppuccin }
