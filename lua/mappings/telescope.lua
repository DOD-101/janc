local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions

vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "find files [telescope]" })
vim.keymap.set("n", "<leader>g", extensions.live_grep_args.live_grep_args, { desc = "live grep [telescope]" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "list buffers [telescope]" })
vim.keymap.set("n", "<leader>p", builtin.builtin, { desc = "builtin commands [telescope]" })
vim.keymap.set("n", "<leader>e", builtin.diagnostics, { desc = "show diagnostics [telescope]" })
vim.keymap.set("n", "<leader>l", builtin.spell_suggest, { desc = "spell suggestions [telescope]" })
vim.keymap.set("n", "<leader>r", builtin.resume, { desc = "resume session [telescope]" })
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("TodoTelescope")
end, { desc = "open todo list [telescope]" })
