local U = {}

--- Deep copy a table
---@param orig table
---@return table
function U.deep_copy(orig)
	local copy = {}
	for k, v in pairs(orig) do
		if type(v) == "table" then
			copy[k] = U.deep_copy(v) -- Recursive copy
		else
			copy[k] = v
		end
	end
	return copy
end

return U
