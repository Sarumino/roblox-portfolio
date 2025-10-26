-- TradeClient.lua
-- Client interface to trading system

local Remotes = require(script.Parent.TradeRemotes)

local TradeClient = {}

-- Request trade with another player
function TradeClient:Request(targetPlayer)
    Remotes.RequestTrade:FireServer(targetPlayer)
end

-- Add item to trade
function TradeClient:AddItem(itemId, quantity)
    Remotes.AddTradeItem:FireServer(itemId, quantity or 1)
end

-- Remove item from trade
function TradeClient:RemoveItem(itemId, quantity)
    Remotes.RemoveTradeItem:FireServer(itemId, quantity or 1)
end

-- Lock trade
function TradeClient:Lock()
    Remotes.LockTrade:FireServer()
end

-- Cancel trade
function TradeClient:Cancel()
    Remotes.CancelTrade:FireServer()
end

-- Confirm trade
function TradeClient:Confirm()
    return Remotes.ConfirmTrade:InvokeServer()
end

return TradeClient
