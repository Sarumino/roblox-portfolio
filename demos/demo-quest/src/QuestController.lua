-- QuestController.lua
-- Connects server quest logic to remotes

local QuestServer = require(script.Parent.QuestServer)
local Remotes = require(script.Parent.QuestRemotes)

-- Start quest
Remotes.StartQuest.OnServerEvent:Connect(function(player, questId)
    QuestServer.StartQuest(player, questId)
end)

-- Progress quest
Remotes.ProgressQuest.OnServerEvent:Connect(function(player, questId, amount)
    QuestServer.Progress(player, questId, amount)
end)

-- Complete quest
Remotes.CompleteQuest.OnServerEvent:Connect(function(player, questId)
    return QuestServer.Complete(player, questId)
end)

-- Get current quest state
function Remotes.GetQuestState.OnServerInvoke(player)
    return QuestServer.GetState(player)
end
