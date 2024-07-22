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
	vim.diagnostic.goto_next({ source = "workspace", severity = { min = vim.diagnostic.severity.WARN } })
end)

vim.keymap.set("n", "gE", function()
	vim.diagnostic.goto_prev({ source = "workspace" })
end)
