# Data Save System Demo – Server Authoritative Design
===================================================

This project demonstrates a safe and modular data saving system for Roblox using DataStoreService.  
It uses server authority and retry logic to prevent data loss and exploits while keeping the structure easy to extend.

Features
--------
- Player data loading and saving
- Safe DataStore retry logic
- Leaderstats setup (Coins + Gems)
- RemoteEvents with server validation
- Client API for data access
- Auto-save system

File Structure
--------------
demos/demo-data/src
│
├── DataStoreManager.lua     -- DataStore handler with retry logic
├── PlayerData.lua           -- Player data container
├── DataServer.lua           -- Auto-save + leaderstats
├── DataRemotes.lua          -- Remote communication
├── DataController.lua       -- Currency update logic
└── DataClient.lua           -- Client request API
└── DataClientLoader.lua     -- Client initializer

Example Usage
-------------
-- Add coins from client
DataClient:AddCurrency("Coins", 50)

-- Get player data
local data = DataClient:Get()
print(data.Coins, data.Gems)

Next Steps
----------
- UI for shop + currency display
- Data versioning
- Daily rewards
- Offline backup
- Anti-exploit integration
