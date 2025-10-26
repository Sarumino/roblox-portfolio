-- TradeRemotes.lua
-- Defines remote events for trading system

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local folder = ReplicatedStorage:FindFirstChild("TradeRemotes")
if not folder then
    folder = Instance.new("Folder")
    folder.Name = "TradeRemotes"
    folder.Parent = ReplicatedStorage
end

local RequestTrade = folder:FindFirstChild("RequestTrade") or Instance.new("RemoteEvent")
RequestTrade.Name = "RequestTrade"
RequestTrade.Parent = folder

local AddTradeItem = folder:FindFirstChild("AddTradeItem") or Instance.new("RemoteEvent")
AddTradeItem.Name = "AddTradeItem"
AddTradeItem.Parent = folder

local RemoveTradeItem = folder:FindFirstChild("RemoveTradeItem") or Instance.new("RemoteEvent")
RemoveTradeItem.Name = "RemoveTradeItem"
RemoveTradeItem.Parent = folder

local LockTrade = folder:FindFirstChild("LockTrade") or Instance.new("RemoteEvent")
LockTrade.Name = "LockTrade"
LockTrade.Parent = folder

local CancelTrade = folder:FindFirstChild("CancelTrade") or Instance.new("RemoteEvent")
CancelTrade.Name = "CancelTrade"
CancelTrade.Parent = folder

local ConfirmTrade = folder:FindFirstChild("ConfirmTrade") or Instance.new("RemoteFunction")
ConfirmTrade.Name = "ConfirmTrade"
ConfirmTrade.Parent = folder

return {
    RequestTrade = RequestTrade,
    AddTradeItem = AddTradeItem,
    RemoveTradeItem = RemoveTradeItem,
    LockTrade = LockTrade,
    CancelTrade = CancelTrade,
    ConfirmTrade = ConfirmTrade
}
