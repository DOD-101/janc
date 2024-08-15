local open_diagnostic = true
vim.o.updatetime = 250

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

local function open_diagnostics()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = "rounded",
		source = "always",
		prefix = " ",
	}
	if open_diagnostic then
		vim.diagnostic.open_float(nil, opts)
	end
end

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		open_diagnostics()
	end,
})

local function toggle_diagnostics()
	if open_diagnostic == false then
		open_diagnostic = true
		open_diagnostics()
		return
	end

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative ~= "" then
			vim.api.nvim_win_close(win, true)
			open_diagnostic = false
			break
		end
	end
end

vim.keymap.set("n", "<leader>d", toggle_diagnostics, { desc = "Toggle Diagnostics" })

vim.api.nvim_create_autocmd("CursorMoved", {
	callback = function()
		open_diagnostic = true
	end,
})

-- return toggle_diagnostics so that other parts of the config can use it
return toggle_diagnostics
