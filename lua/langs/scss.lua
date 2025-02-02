local utils = require("utils")
local css = require("langs.css")

---@type Lang
local lang = utils.deep_copy(css)

lang.name = "scss"

return lang
