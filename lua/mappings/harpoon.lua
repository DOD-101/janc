local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "add buffer [harpoon]" })

vim.keymap.set("n", "<leader>s", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "show buffers [harpoon]" })

for i = 0, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		harpoon:list():select(i)
	end, { desc = "jump to buffer " .. i .. " [harpoon]" })
end

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>m", function()
	harpoon:list():next()
end, { desc = "next buffer [harpoon]" })

vim.keymap.set("n", "<leader>n", function()
	harpoon:list():prev()
end, { desc = "prev buffer [harpoon]" })
