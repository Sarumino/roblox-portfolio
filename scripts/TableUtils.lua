-- TableUtils.lua
-- Useful helper functions for tables

local TableUtils = {}

-- Shallow copy
function TableUtils.ShallowCopy(t)
	local new = {}
	for k, v in pairs(t) do
		new[k] = v
	end
	return new
end

-- Deep copy
function TableUtils.DeepCopy(t)
	local new = {}
	for k, v in pairs(t) do
		new[k] = type(v) == "table" and TableUtils.DeepCopy(v) or v
	end
	return new
end

-- Find value
function TableUtils.Find(t, value)
	for i, v in ipairs(t) do
		if v == value then
			return i
		end
	end
	return nil
end

-- Merge two tables
function TableUtils.Merge(a, b)
	local result = TableUtils.ShallowCopy(a)
	for k, v in pairs(b) do
		result[k] = v
	end
	return result
end

return TableUtils
