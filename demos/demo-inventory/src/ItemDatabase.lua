-- ItemDatabase.lua
-- Defines all valid items in the inventory system

local ItemDatabase = {
    ["Apple"] = {
        id = "Apple",
        maxStack = 20,
        description = "A basic food item.",
    },

    ["Sword"] = {
        id = "Sword",
        maxStack = 1,
        description = "A simple melee weapon.",
    },

    ["Gem"] = {
        id = "Gem",
        maxStack = 999,
        description = "A valuable currency item.",
    }
}

-- Check if an item exists in database
function ItemDatabase.Exists(itemId)
    return ItemDatabase[itemId] ~= nil
end

return ItemDatabase
