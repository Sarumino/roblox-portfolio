-- Remotes.lua
-- Creates and provides RemoteEvents for Gacha UI <-> Server communication

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RemotesFolder = ReplicatedStorage:FindFirstChild("GachaRemotes")
if not RemotesFolder then
    RemotesFolder = Instance.new("Folder")
    RemotesFolder.Name = "GachaRemotes"
    RemotesFolder.Parent = ReplicatedStorage
end

-- Remote Events
local PullRemote = RemotesFolder:FindFirstChild("PullRequest") or Instance.new("RemoteFunction")
PullRemote.Name = "PullRequest"
PullRemote.Parent = RemotesFolder

return {
    PullRequest = PullRemote
}
