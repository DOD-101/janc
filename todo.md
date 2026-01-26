## TODO

- [ ] Optimize Performance

- [ ] find a way to get better spell checking (typo lsp)

- [ ] make janc more configurable based on the project (e.g: what's if you are
  using deno (denolsp) or node (ts_ls)?look into rust-tools?) (See: [Refactor](#Refactor))

- [ ] Decide on harpoon. Do I need it?

- [ ] Keep an eye on https://github.com/saghen/blink.cmp/pull/2238

- [ ] Look into conventional commits lsp. (something that shows you previous commits as completions)

- [ ] Improve the experience when large texts are printed (less like preview is not searchable)

- [ ] Improve experience around quick fix lists (binds, adding and removing to and form them, ...)

# Refactor

1. Make more things configurable via `JANC_` env variables and/or potentially some sort of `.janc.lua` file for project-specific config

2. Rework `langs/` to go along with `1.`

3. Improve ergonomics around `:ListLangTools`

    1. Maybe some sort of ui?




