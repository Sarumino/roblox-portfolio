-- DataServer.lua
-- Handles data loading, saving and leaderstats

local Players = game:GetService("Players")
local PlayerData = require(script.Parent.PlayerData)

local playerProfiles = {} -- store PlayerData objects

-- Setup leaderstats
local function createLeaderstats(player, data)
    local folder = Instance.new("Folder")
    folder.Name = "leaderstats"
    folder.Parent = player

    local coins = Instance.new("IntValue")
    coins.Name = "Coins"
    coins.Value = data.Coins
    coins.Parent = folder

    local gems = Instance.new("IntValue")
    gems.Name = "Gems"
    gems.Value = data.Gems
    gems.Parent = folder
end

-- Player joins
Players.PlayerAdded:Connect(function(player)
    local profile = PlayerData.new(player)
    playerProfiles[player] = profile
    createLeaderstats(player, profile:GetData())
end)

-- Player leaves
Players.PlayerRemoving:Connect(function(player)
    if playerProfiles[player] then
        playerProfiles[player]:Save()
        playerProfiles[player] = nil
    end
end)

-- Auto-save every 60 seconds
task.spawn(function()
    while task.wait(60) do
        for player, profile in pairs(playerProfiles) do
            profile:Save()
        end
    end
end)
