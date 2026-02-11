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
		integrations = {
			gitgutter = true,
			blink_cmp = true,
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
