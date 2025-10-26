-- Remotes.lua
-- Remote communication layer for Inventory System

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create folder if missing
local folder = ReplicatedStorage:FindFirstChild("InventoryRemotes")
if not folder then
    folder = Instance.new("Folder")
    folder.Name = "InventoryRemotes"
    folder.Parent = ReplicatedStorage
end

-- Remote events/functions
local AddItem = folder:FindFirstChild("AddItem") or Instance.new("RemoteEvent")
AddItem.Name = "AddItem"
AddItem.Parent = folder

local RemoveItem = folder:FindFirstChild("RemoveItem") or Instance.new("RemoteEvent")
RemoveItem.Name = "RemoveItem"
RemoveItem.Parent = folder

local RequestInventory = folder:FindFirstChild("RequestInventory") or Instance.new("RemoteFunction")
RequestInventory.Name = "RequestInventory"
RequestInventory.Parent = folder

return {
    AddItem = AddItem,
    RemoveItem = RemoveItem,
    RequestInventory = RequestInventory
}
