-- QuestRemotes.lua
-- Remote connections for Quest System

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Folder to hold quest remotes
local folder = ReplicatedStorage:FindFirstChild("QuestRemotes")
if not folder then
    folder = Instance.new("Folder")
    folder.Name = "QuestRemotes"
    folder.Parent = ReplicatedStorage
end

-- Remotes
local StartQuest = folder:FindFirstChild("StartQuest") or Instance.new("RemoteEvent")
StartQuest.Name = "StartQuest"
StartQuest.Parent = folder

local ProgressQuest = folder:FindFirstChild("ProgressQuest") or Instance.new("RemoteEvent")
ProgressQuest.Name = "ProgressQuest"
ProgressQuest.Parent = folder

local CompleteQuest = folder:FindFirstChild("CompleteQuest") or Instance.new("RemoteEvent")
CompleteQuest.Name = "CompleteQuest"
CompleteQuest.Parent = folder

local GetQuestState = folder:FindFirstChild("GetQuestState") or Instance.new("RemoteFunction")
GetQuestState.Name = "GetQuestState"
GetQuestState.Parent = folder

return {
    StartQuest = StartQuest,
    ProgressQuest = ProgressQuest,
    CompleteQuest = CompleteQuest,
    GetQuestState = GetQuestState
}
