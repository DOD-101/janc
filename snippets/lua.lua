return {
	s("kmp", {

		t("vim.keymap.set("),
		i(1, [["n"]]),
		t(", "),
		i(2, [["<leader>"]]),
		t(", "),
		i(3, [["cmd"]]),
		c(4, {
			t(")"),
			t(", { noremap = true, silent = true })"),
		}),
	}),
}
