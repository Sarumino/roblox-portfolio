-- DataController.lua
-- Handles currency updates via remotes

local Players = game:GetService("Players")
local PlayerData = require(script.Parent.PlayerData)
local Remotes = require(script.Parent.DataRemotes)

local playerProfiles = {}

-- Link player profiles
Players.PlayerAdded:Connect(function(player)
    playerProfiles[player] = PlayerData.new(player)
end)

Players.PlayerRemoving:Connect(function(player)
    playerProfiles[player] = nil
end)

-- Add currency request
Remotes.AddCurrency.OnServerEvent:Connect(function(player, currency, amount)
    local profile = playerProfiles[player]
    if profile and typeof(amount) == "number" and amount > 0 then
        profile:AddCurrency(currency, amount)

        -- Sync leaderstats
        if player.leaderstats and player.leaderstats:FindFirstChild(currency) then
            player.leaderstats[currency].Value = profile:GetData()[currency]
        end
    end
end)

-- Fetch player data
function Remotes.GetData.OnServerInvoke(player)
    local profile = playerProfiles[player]
    return profile and profile:GetData() or {}
end
