---@type Lang
local lang = {
	name = "rust",
	formatters = {},
	lsps = { "rust_analyzer" },
	patterns = { "*.rs" },
}

if not vim.env.JANC_NO_RUST_FIX then
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = lang.patterns,
		once = false,
		callback = function(args)
			local bufnr = args.buf
			vim.system({ "cargo", "clippy", "--fix", "--allow-dirty" }, { text = true }, function(result)
				vim.schedule(function()
					if result.code ~= 0 then
						vim.notify("clippy --fix failed: " .. (result.stderr or ""), vim.log.levels.ERROR)
						return
					else
						vim.notify("Ran clippy --fix.", vim.log.levels.INFO)
					end
					-- Reload the buffer from disk
					if vim.api.nvim_buf_is_valid(bufnr) then
						vim.api.nvim_buf_call(bufnr, function()
							vim.cmd("checktime")
						end)
					end
				end)
			end)
		end,
	})
end

return lang
