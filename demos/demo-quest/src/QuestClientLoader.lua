-- QuestClientLoader.lua
-- Loads QuestClient and prints current quest state (debug)

local QuestClient = require(script.Parent.QuestClient)

task.delay(1, function()
    local state = QuestClient:GetState()
    print("[QuestClient] Active quests:", state.active)
    print("[QuestClient] Completed quests:", state.completed)
end)
