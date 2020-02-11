--- Extension of string.
--- Splits a string into a list of strings separated by the given phrase.
--- Separator may be multi-charactered.
--- @param self string
--- @param sep string - Separator
--- @param returnType string - Optional; "table" or "single"
--- @return: List of strings, or a table of strings if returnType is "table", or two strings (separate only the first match) if returnType is "single"
function string:split(sep, returnType)
	if returnType == "table" then
		return table.pack(self:split(sep))
	end
	local sepFrom, sepTo = self:find(sep)
	if sepFrom then
		if returnType == "single" then
			return self:sub(1, sepFrom-1), self:sub(sepTo+1)
		end
		return self:sub(1, sepFrom-1), self:sub(sepTo+1):split(sep)
	end
	return self
end
