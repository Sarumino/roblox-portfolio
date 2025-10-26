-- DataClient.lua
-- Client API to request and modify player data

local Remotes = require(script.Parent.DataRemotes)

local DataClient = {}

-- Get full player data table
function DataClient:Get()
    local data = Remotes.GetData:InvokeServer()
    return data
end

-- Add coins/gems from client
function DataClient:AddCurrency(currency, amount)
    Remotes.AddCurrency:FireServer(currency, amount)
end

return DataClient
