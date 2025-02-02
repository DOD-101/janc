local utils = require("utils")
local json = require("langs.json")

---@type Lang
local lang = utils.deep_copy(json)

lang.name = "jsonc"
lang.pattern = { "*.jsonc" }

return lang
