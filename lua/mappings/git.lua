local builtin = require("telescope.builtin")

local git_leader = "<leader><leader>"

vim.keymap.set("n", git_leader .. "g", ":tab Git<CR>", { noremap = true, silent = true })
vim.keymap.set("n", git_leader .. "f", ":Flog<CR>", { noremap = true, silent = true })

vim.keymap.set("n", git_leader .. "c", builtin.git_commits, {})
vim.keymap.set("n", git_leader .. "b", builtin.git_branches, {})
vim.keymap.set("n", git_leader .. "s", builtin.git_stash, {})

vim.keymap.set("n", git_leader .. "n", ":GitGutterNextHunk<CR>")
vim.keymap.set("n", git_leader .. "p", ":GitGutterPrevHunk<CR>")
vim.keymap.set("n", git_leader .. "d", ":GitGutterPreviewHunk<CR>")
