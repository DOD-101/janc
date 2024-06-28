local plugin = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.g.gitblame_display_virtual_text = 0
		require("lualine").setup({
			sections = {
				lualine_b = { "branch", "diagnostics" },
				lualine_x = {
					"encoding",
					"filetype",
				},
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
		})
	end,
}

return plugin
