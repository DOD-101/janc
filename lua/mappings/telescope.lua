local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions

vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>g", extensions.live_grep_args.live_grep_args, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>p", builtin.builtin, {})
vim.keymap.set("n", "<leader>e", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>l", builtin.spell_suggest, {})
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("TodoTelescope")
end, {})
