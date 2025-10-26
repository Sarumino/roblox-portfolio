-- QuestClient.lua
-- Client interface for quest interaction

local Remotes = require(script.Parent.QuestRemotes)

local QuestClient = {}

-- Start a quest
function QuestClient:Start(questId)
    Remotes.StartQuest:FireServer(questId)
end

-- Progress quest
function QuestClient:Progress(questId, amount)
    Remotes.ProgressQuest:FireServer(questId, amount or 1)
end

-- Complete a quest
function QuestClient:Complete(questId)
    return Remotes.CompleteQuest:InvokeServer(questId)
end

-- Get quest state from server
function QuestClient:GetState()
    local state = Remotes.GetQuestState:InvokeServer()
    return state
end

return QuestClient
