local plugin = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.g.gitblame_display_virtual_text = 0
		local opts = {
			options = {
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_b = { "branch", "diagnostics" },
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = { "diff" },
				lualine_y = { "filetype" },
				lualine_z = { "progress" },
			},
		}

		if string.match(vim.env.JANC_NVIM_COLORSCHEME, "catppuccin-.") then
			opts.options.section_separators = { left = "◗", right = "◖" }
		end

		require("lualine").setup(opts)
	end,
}

return plugin
