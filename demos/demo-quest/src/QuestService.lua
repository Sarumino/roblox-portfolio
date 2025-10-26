-- QuestService.lua
-- Handles all quest logic

local QuestDatabase = require(script.Parent.QuestDatabase)

local QuestService = {}
QuestService.__index = QuestService

-- Creates a fresh quest profile for a player
function QuestService.new()
    local self = setmetatable({}, QuestService)
    self.activeQuests = {}     -- { questId = progress }
    self.completedQuests = {}  -- { questId = true }
    return self
end

-- Start a quest
function QuestService:StartQuest(questId)
    if self.completedQuests[questId] then
        return false, "Quest already completed"
    end
    if self.activeQuests[questId] then
        return false, "Quest already active"
    end

    self.activeQuests[questId] = 0
    return true
end

-- Progress a quest (collector, kill, talk, any type)
function QuestService:ProgressQuest(questId, amount)
    amount = amount or 1
    local quest = QuestDatabase[questId]
    if not quest then return false, "Invalid quest" end
    if not self.activeQuests[questId] then return false, "Quest not started" end

    local newProgress = self.activeQuests[questId] + amount
    self.activeQuests[questId] = newProgress

    if newProgress >= (quest.requirement.amount or 1) then
        return true, "completed"
    end

    return true, "progress"
end

-- Finish quest and claim reward
function QuestService:CompleteQuest(questId)
    local quest = QuestDatabase[questId]
    if not quest then return false, "Invalid quest" end

    self.activeQuests[questId] = nil
    self.completedQuests[questId] = true

    return quest.reward
end

-- Return quest state
function QuestService:GetState()
    return {
        active = self.activeQuests,
        completed = self.completedQuests
    }
end

return QuestService
