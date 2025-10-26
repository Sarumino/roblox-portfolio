-- QuestServer.lua
-- Server authority for quest progression

local Players = game:GetService("Players")
local QuestService = require(script.Parent.QuestService)

local playerQuests = {} -- { player = QuestService }

Players.PlayerAdded:Connect(function(player)
    playerQuests[player] = QuestService.new()
end)

Players.PlayerRemoving:Connect(function(player)
    playerQuests[player] = nil
end)

-- API
local QuestServer = {}

-- Start quest
function QuestServer.StartQuest(player, questId)
    local qs = playerQuests[player]
    if not qs then return false end
    return qs:StartQuest(questId)
end

-- Progress quest
function QuestServer.Progress(player, questId, amount)
    local qs = playerQuests[player]
    if not qs then return false end
    return qs:ProgressQuest(questId, amount)
end

-- Complete quest
function QuestServer.Complete(player, questId)
    local qs = playerQuests[player]
    if not qs then return false end
    return qs:CompleteQuest(questId)
end

-- Get quest state
function QuestServer.GetState(player)
    local qs = playerQuests[player]
    return qs and qs:GetState() or {}
end

return QuestServer
