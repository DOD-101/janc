return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = true,
	config = function()
		local highlight = {
			"Main",
		}

		local scope = {
			"ScopeMain",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "Main", { fg = "#555682" })
			vim.api.nvim_set_hl(0, "ScopeMain", { fg = "#6A6CD2" })
		end)

		require("ibl").setup({
			indent = { highlight = highlight },
			scope = { highlight = scope, show_start = false, show_end = false },
		})
	end,
}
