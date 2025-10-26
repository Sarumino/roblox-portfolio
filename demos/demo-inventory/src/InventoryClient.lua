-- InventoryClient.lua
-- Handles client communication for inventory system

local Remotes = require(script.Parent.Remotes)

local InventoryClient = {}
InventoryClient.Inventory = {}

-- Fetch full inventory from server
function InventoryClient:Load()
    local data = Remotes.RequestInventory:InvokeServer()
    self.Inventory = data or {}
    return self.Inventory
end

-- Request add item
function InventoryClient:Add(itemId, quantity)
    Remotes.AddItem:FireServer(itemId, quantity or 1)
end

-- Request remove item
function InventoryClient:Remove(itemId, quantity)
    Remotes.RemoveItem:FireServer(itemId, quantity or 1)
end

return InventoryClient
