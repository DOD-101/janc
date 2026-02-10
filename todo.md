## TODO

- [ ] Optimize Performance

- [ ] make janc more configurable based on the project (e.g: what's if you are
  using deno (denolsp) or node (ts_ls)? look into rust-tools) (See: [Refactor](#Refactor))

- [ ] Remove harpoon.

- [ ] Keep an eye on https://github.com/saghen/blink.cmp/pull/2238

- [ ] Look into conventional commits lsp. (something that shows you previous commits as completions)

    `g log --oneline | grep -e ".* [a-z]*(.*):" | sed "s/.* [a-z]*(\(.*\)):.*/\1/" | sort | uniq`

- [ ] Improve the experience when large texts are printed (less like preview is not searchable)

- [ ] Improve experience around quick fix lists (binds, adding and removing to and form them, ...)

# Refactor

1. Use `.nvim.lua` file for project-specific config (execrc)

2. Improve ergonomics around `:ListLangTools`

    1. Maybe some sort of ui?
