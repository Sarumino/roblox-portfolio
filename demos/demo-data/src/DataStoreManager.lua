-- DataStoreManager.lua
-- Safe DataStore handler with retry logic and error protection

local DataStoreService = game:GetService("DataStoreService")

local DataStoreManager = {}
DataStoreManager.__index = DataStoreManager

-- Constructor
function DataStoreManager.new(storeName)
    local self = setmetatable({}, DataStoreManager)
    self.store = DataStoreService:GetDataStore(storeName)
    return self
end

-- Load player data safely
function DataStoreManager:LoadData(key, defaultData)
    local success, data
    for i = 1, 3 do -- retry up to 3 times
        success, data = pcall(function()
            return self.store:GetAsync(key)
        end)
        if success then break end
        warn("[DataStoreManager] Load failed, retrying...", i)
        task.wait(0.5)
    end
    return success and data or defaultData
end

-- Save player data safely
function DataStoreManager:SaveData(key, data)
    local success
    for i = 1, 3 do
        success = pcall(function()
            self.store:SetAsync(key, data)
        end)
        if success then break end
        warn("[DataStoreManager] Save failed, retrying...", i)
        task.wait(0.5)
    end
    return success
end

return DataStoreManager
