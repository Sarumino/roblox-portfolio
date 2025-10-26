-- TradeController.lua
-- Server-side trade logic connection

local TradeManager = require(script.Parent.TradeManager)
local Remotes = require(script.Parent.TradeRemotes)

-- Player sends trade request
Remotes.RequestTrade.OnServerEvent:Connect(function(player, targetPlayer)
	if player == targetPlayer then return end
	TradeManager.RequestTrade(player, targetPlayer)
end)

-- Add item to trade
Remotes.AddTradeItem.OnServerEvent:Connect(function(player, itemId, quantity)
	local trade = TradeManager.GetTrade(player)
	if trade then
		trade:AddItem(player, itemId, quantity)
	end
end)

-- Remove item from trade
Remotes.RemoveTradeItem.OnServerEvent:Connect(function(player, itemId, quantity)
	local trade = TradeManager.GetTrade(player)
	if trade then
		trade:RemoveItem(player, itemId, quantity)
	end
end)

-- Lock player's trade
Remotes.LockTrade.OnServerEvent:Connect(function(player)
	local trade = TradeManager.GetTrade(player)
	if trade then
		trade:Lock(player)
	end
end)

-- Cancel trade
Remotes.CancelTrade.OnServerEvent:Connect(function(player)
	TradeManager.CancelTrade(player)
end)

-- Confirm trade (server executes final exchange)
function Remotes.ConfirmTrade.OnServerInvoke(player)
	local trade = TradeManager.GetTrade(player)
	if not trade then return false end
	trade.status = "confirmed"
	return true
end
