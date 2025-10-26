-- Signal.lua
-- Lightweight custom event system

local Signal = {}
Signal.__index = Signal

function Signal.new()
	local self = setmetatable({}, Signal)
	self._listeners = {}
	return self
end

function Signal:Connect(callback)
	table.insert(self._listeners, callback)
	return {
		Disconnect = function()
			for i, fn in ipairs(self._listeners) do
				if fn == callback then
					table.remove(self._listeners, i)
					break
				end
			end
		end
	}
end

function Signal:Fire(...)
	for _, fn in ipairs(self._listeners) do
		fn(...)
	end
end

function Signal:Wait()
	local thread = coroutine.running()
	local connection
	connection = self:Connect(function(...)
		connection:Disconnect()
		coroutine.resume(thread, ...)
	end)
	return coroutine.yield()
end

return Signal
