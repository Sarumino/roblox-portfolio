-- InventoryServer.lua
-- Server authority for player inventories

local Players = game:GetService("Players")
local InventoryService = require(script.Parent.InventoryService)
local Remotes = require(script.Parent.Remotes)

-- Store inventories per player
local playerInventories = {}

-- Create inventory when player joins
Players.PlayerAdded:Connect(function(player)
    local inv = InventoryService.new(20) -- 20 slots
    playerInventories[player] = inv
end)

-- Cleanup when player leaves
Players.PlayerRemoving:Connect(function(player)
    playerInventories[player] = nil
end)

-- Add item request
Remotes.AddItem.OnServerEvent:Connect(function(player, itemId, quantity)
    local inv = playerInventories[player]
    if inv then
        inv:AddItem(itemId, quantity)
    end
end)

-- Remove item request
Remotes.RemoveItem.OnServerEvent:Connect(function(player, itemId, quantity)
    local inv = playerInventories[player]
    if inv then
        inv:RemoveItem(itemId, quantity)
    end
end)

-- Client requests full inventory
function Remotes.RequestInventory.OnServerInvoke(player)
    local inv = playerInventories[player]
    return inv and inv:GetInventory() or {}
end
