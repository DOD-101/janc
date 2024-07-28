local plugin = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.g.gitblame_display_virtual_text = 0
		require("lualine").setup({
			sections = {
				lualine_b = { "branch", "diagnostics" },
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = { "progress" },
			},
		})
	end,
}

return plugin
