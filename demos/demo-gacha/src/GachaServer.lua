-- GachaServer.lua
-- Handles gacha pull requests from players

local GachaService = require(script.Parent.GachaService)
local Remotes = require(script.Parent.Remotes)

local Players = game:GetService("Players")

-- Store player stats here (simple demo), normally use DataStore
local playerStats = {}

-- Setup default stats
local function setupPlayer(player)
	playerStats[player.UserId] = {
		luck = 5, -- base luck
		pity = 0  -- starts at 0
	}
end

Players.PlayerAdded:Connect(setupPlayer)

Players.PlayerRemoving:Connect(function(player)
	playerStats[player.UserId] = nil
end)

-- Handle gacha pull requests
Remotes.PullRequest.OnServerInvoke = function(player)
	local stats = playerStats[player.UserId]
	if not stats then
		setupPlayer(player)
		stats = playerStats[player.UserId]
	end

	-- Perform pull
	local result, updatedStats = GachaService.Pull(stats)
	playerStats[player.UserId] = updatedStats -- save changes

	return {
		rarity = result.name,
		color = result.color,
		pity = updatedStats.pity
	}
end
