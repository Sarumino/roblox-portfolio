-- InventoryClientLoader.lua
-- Loads inventory client and requests initial data

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local InventoryClient = require(script.Parent.InventoryClient)

-- Load inventory on start
local player = Players.LocalPlayer

task.wait(1) -- wait for remotes
local invData = InventoryClient:Load()

print("[InventoryClient] Loaded inventory:")
print(invData)
