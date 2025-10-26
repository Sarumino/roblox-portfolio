-- TradeExecutor.lua
-- Finalizes item exchange between players safely

local TradeManager = require(script.Parent.TradeManager)

local TradeExecutor = {}

function TradeExecutor.Execute(player)
	local trade = TradeManager.GetTrade(player)
	if not trade or trade.status ~= "confirmed" then
		return false, "Invalid trade"
	end

	local p1, p2 = trade.players[1], trade.players[2]

	-- Validate inventory exists
	if not p1.Inventory or not p2.Inventory then
		warn("Missing inventory")
		return false
	end

	-- Exchange items
	for itemId, qty in pairs(trade.offers[p1]) do
		p1.Inventory:RemoveItem(itemId, qty)
		p2.Inventory:AddItem(itemId, qty)
	end

	for itemId, qty in pairs(trade.offers[p2]) do
		p2.Inventory:RemoveItem(itemId, qty)
		p1.Inventory:AddItem(itemId, qty)
	end

	-- Cleanup
	TradeManager.FinishTrade(trade)
	return true
end

return TradeExecutor
