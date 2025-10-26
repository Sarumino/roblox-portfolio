-- TradeService.lua
-- Handles item trading system logic

local TradeService = {}
TradeService.__index = TradeService

-- Possible trade states
local STATUS = {
	REQUESTED = "requested",
	OPEN = "open",
	LOCKED = "locked",
	CONFIRMED = "confirmed",
	CANCELLED = "cancelled"
}

-- Create a new trade session
function TradeService.new(player1, player2)
	local self = setmetatable({}, TradeService)
	self.players = {player1, player2}
	self.offers = {
		[player1] = {},
		[player2] = {}
	}
	self.locked = {
		[player1] = false,
		[player2] = false
	}
	self.status = STATUS.REQUESTED
	return self
end

-- Add item to trade
function TradeService:AddItem(player, itemId, quantity)
	if self.status ~= STATUS.OPEN then return false end
	if self.locked[player] then return false end

	self.offers[player][itemId] = (self.offers[player][itemId] or 0) + quantity
	return true
end

-- Remove item from trade
function TradeService:RemoveItem(player, itemId, quantity)
	if self.status ~= STATUS.OPEN then return false end
	if self.locked[player] then return false end

	if self.offers[player][itemId] then
		self.offers[player][itemId] -= quantity
		if self.offers[player][itemId] <= 0 then
			self.offers[player][itemId] = nil
		end
	end
	return true
end

-- Lock offer
function TradeService:Lock(player)
	self.locked[player] = true
	if self.locked[self.players[1]] and self.locked[self.players[2]] then
		self.status = STATUS.LOCKED
	end
end

-- Cancel trade
function TradeService:Cancel()
	self.status = STATUS.CANCELLED
end

return TradeService
