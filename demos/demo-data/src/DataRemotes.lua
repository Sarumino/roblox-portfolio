-- DataRemotes.lua
-- Remote signals for safe currency modification from client

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local folder = ReplicatedStorage:FindFirstChild("DataRemotes")
if not folder then
    folder = Instance.new("Folder")
    folder.Name = "DataRemotes"
    folder.Parent = ReplicatedStorage
end

local AddCurrency = folder:FindFirstChild("AddCurrency") or Instance.new("RemoteEvent")
AddCurrency.Name = "AddCurrency"
AddCurrency.Parent = folder

local GetData = folder:FindFirstChild("GetData") or Instance.new("RemoteFunction")
GetData.Name = "GetData"
GetData.Parent = folder

return {
    AddCurrency = AddCurrency,
    GetData = GetData
}
