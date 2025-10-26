-- Debounce.lua
-- Simple debounce helper to prevent action spam

local Debounce = {}
Debounce.__index = Debounce

function Debounce.new(cooldown)
	local self = setmetatable({}, Debounce)
	self.cooldown = cooldown or 1
	self._lastCall = 0
	return self
end

function Debounce:Ready()
	return (os.clock() - self._lastCall) >= self.cooldown
end

function Debounce:Use()
	self._lastCall = os.clock()
end

function Debounce:Execute(callback)
	if self:Ready() then
		self:Use()
		callback()
	end
end

return Debounce
