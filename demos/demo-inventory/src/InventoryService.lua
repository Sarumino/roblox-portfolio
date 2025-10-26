-- InventoryService.lua
-- Handles core inventory logic (server-side safe)

local ItemDatabase = require(script.Parent.ItemDatabase)

local InventoryService = {}
InventoryService.__index = InventoryService

-- Creates a new empty inventory
function InventoryService.new(maxSlots)
    local self = setmetatable({}, InventoryService)
    self.maxSlots = maxSlots or 20
    self.slots = {} -- { {item = "Apple", quantity = 5}, ... }
    return self
end

-- Returns the full inventory table
function InventoryService:GetInventory()
    return self.slots
end

-- Adds an item safely
function InventoryService:AddItem(itemId, quantity)
    quantity = quantity or 1
    if not ItemDatabase.Exists(itemId) then
        warn("Invalid item:", itemId)
        return false
    end

    -- Try stacking first
    for _, slot in ipairs(self.slots) do
        if slot.item == itemId then
            local itemInfo = ItemDatabase[itemId]
            local addAmount = math.min(quantity, itemInfo.maxStack - slot.quantity)
            slot.quantity += addAmount
            quantity -= addAmount
            if quantity <= 0 then return true end
        end
    end

    -- Add to new slot if needed
    while quantity > 0 and #self.slots < self.maxSlots do
        local itemInfo = ItemDatabase[itemId]
        local addAmount = math.min(quantity, itemInfo.maxStack)
        table.insert(self.slots, {
            item = itemId,
            quantity = addAmount
        })
        quantity -= addAmount
    end

    -- If quantity is still left, inventory was full
    return quantity <= 0
end

-- Removes an item safely
function InventoryService:RemoveItem(itemId, quantity)
    quantity = quantity or 1
    for i = #self.slots, 1, -1 do
        local slot = self.slots[i]
        if slot.item == itemId then
            if slot.quantity > quantity then
                slot.quantity -= quantity
                return true
            elseif slot.quantity == quantity then
                table.remove(self.slots, i)
                return true
            else
                quantity -= slot.quantity
                table.remove(self.slots, i)
            end
        end
    end
    return false
end

return InventoryService
