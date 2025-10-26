-- TradeManager.lua
-- Manages active trade sessions

local TradeService = require(script.Parent.TradeService)

local TradeManager = {}
TradeManager.__index = TradeManager

local activeTrades = {} -- { player = TradeService }

-- Start a trade request
function TradeManager.RequestTrade(player1, player2)
	if activeTrades[player1] or activeTrades[player2] then
		return false, "One of the players is already trading"
	end

	local trade = TradeService.new(player1, player2)
	activeTrades[player1] = trade
	activeTrades[player2] = trade
	trade.status = "open"
	return true, trade
end

-- Get a player's trade session
function TradeManager.GetTrade(player)
	return activeTrades[player]
end

-- Cancel trade
function TradeManager.CancelTrade(player)
	local trade = activeTrades[player]
	if trade then
		trade:Cancel()
		for _, p in ipairs(trade.players) do
			activeTrades[p] = nil
		end
	end
end

-- Finish trade (cleanup after confirm)
function TradeManager.FinishTrade(trade)
	for _, p in ipairs(trade.players) do
		activeTrades[p] = nil
	end
end

return TradeManager
