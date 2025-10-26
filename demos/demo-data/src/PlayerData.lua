-- PlayerData.lua
-- Handles loading, storing and updating player data

local DataStoreManager = require(script.Parent.DataStoreManager)

local PlayerData = {}
PlayerData.__index = PlayerData

local DATASTORE_NAME = "PlayerDataStore_v1"
local DEFAULT_DATA = {
    Coins = 0,
    Gems = 0,
}

local store = DataStoreManager.new(DATASTORE_NAME)

-- Creates a new PlayerData handler
function PlayerData.new(player)
    local self = setmetatable({}, PlayerData)
    self.player = player
    self.key = "Player_" .. player.UserId
    self.data = store:LoadData(self.key, DEFAULT_DATA)
    return self
end

-- Add currency
function PlayerData:AddCurrency(currency, amount)
    if self.data[currency] then
        self.data[currency] += amount
    end
end

-- Get current data
function PlayerData:GetData()
    return self.data
end

-- Save player data
function PlayerData:Save()
    return store:SaveData(self.key, self.data)
end

return PlayerData
