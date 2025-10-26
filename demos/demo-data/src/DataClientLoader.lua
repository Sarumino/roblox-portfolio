-- DataClientLoader.lua
-- Loads DataClient and checks data sync on startup

local Players = game:GetService("Players")
local DataClient = require(script.Parent.DataClient)

local player = Players.LocalPlayer

task.delay(1, function()
    local data = DataClient:Get()
    print("[DataClient] Player data loaded:", data)
end)
