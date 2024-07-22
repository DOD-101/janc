local SEVERITY_FILTER_LEVEL = "WARN"

local function severity_filter(diagnostics, severity_level)
	local severity_nums = {
		ERROR = 1,
		WARN = 2,
		INFO = 3,
		HINT = 4,
	}

	for _, diagnostic in ipairs(diagnostics) do
		if diagnostic.severity <= severity_nums[severity_level] then
			return true
		end
	end

	return false
end

vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end)

vim.keymap.set("n", "gD", function()
	vim.lsp.buf.declaration()
end)

vim.keymap.set("n", "gh", function()
	vim.lsp.buf.hover()
end)

vim.keymap.set("n", "gi", function()
	vim.lsp.buf.implementation()
end)

vim.keymap.set("n", "gn", function()
	vim.lsp.buf.rename()
end)

vim.keymap.set("n", "gr", function()
	vim.lsp.buf.references()
end)

vim.keymap.set("n", "ge", function()
	local diagnostics = vim.diagnostic.get()

	local warns = severity_filter(diagnostics, SEVERITY_FILTER_LEVEL)

	if warns then
		vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity[SEVERITY_FILTER_LEVEL] } })
	else
		vim.diagnostic.goto_next({})
	end
end)

vim.keymap.set("n", "gE", function()
	local diagnostics = vim.diagnostic.get()

	local warns = severity_filter(diagnostics, SEVERITY_FILTER_LEVEL)

	if warns then
		vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity[SEVERITY_FILTER_LEVEL] } })
	else
		vim.diagnostic.goto_prev({})
	end
end)
