---@module "lazy"
---@type LazyPluginSpec[]
return {
	{
		"DeaconDesperado/colortils.nvim",
		branch = "fix-gradient",
		cmd = "Colortils",
		opts = {},
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		---@module "colorizer"
		---@type colorizer.Options
		---@diagnostic disable: missing-fields
		opts = {
			options = {
				display = {
					mode = "virtualtext",
					virtualtext = {
						char = "󱓻",
					},
				},
			},
		},
		---@diagnostic enable: missing-fields
	},
}
