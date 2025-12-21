local builtin = require("telescope.builtin")

local git_leader = "<leader><leader>"

vim.keymap.set("n", git_leader .. "g", "<cmd>Neogit<CR>", { noremap = true, silent = true })

vim.keymap.set("n", git_leader .. "c", builtin.git_commits, { desc = "show git commits" })
vim.keymap.set("n", git_leader .. "b", builtin.git_branches, { desc = "show git branches" })
vim.keymap.set("n", git_leader .. "s", builtin.git_stash, { desc = "show git stashes" })

vim.keymap.set("n", git_leader .. "n", ":Gitsigns nav_hunk next<CR>")
vim.keymap.set("n", git_leader .. "p", ":Gitsigns nav_hunk prev<CR>")
vim.keymap.set("n", git_leader .. "d", ":Gitsigns preview_hunk<CR>")
vim.keymap.set({ "n", "v" }, git_leader .. "u", ":Gitsigns reset_hunk<CR>")
