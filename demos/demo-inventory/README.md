# Inventory System Demo – Slot and Stack Architecture
==================================================

This project is a clean and modular Inventory System written in Luau for Roblox.  
It uses server-authoritative logic and a stack-based slot structure that supports item quantities and inventory limits.

Features
--------
- Stackable inventory slots
- Add and remove items
- Item database system
- Server-side validation
- Remote events communication
- UI-ready client logic

File Structure
--------------
ReplicatedStorage
└── Modules
    └── Inventory
        ├── ItemDatabase.lua
        ├── InventoryService.lua
        ├── Remotes.lua
        ├── InventoryClient.lua
        └── InventoryClientLoader.lua

ServerScriptService
└── InventoryServer.lua

How It Works
------------
- ItemDatabase defines item properties
- InventoryService manages slots and stacking logic
- InventoryServer validates add/remove operations
- InventoryClient communicates updates to the player
- Remotes connect client and server securely

Example Usage
-------------
-- Add item
InventoryClient:Add("Apple", 5)

-- Remove item
InventoryClient:Remove("Gem", 2)

Next Steps
----------
- UI development (inventory window + slot visuals)
- Equip system
- Hotbar / quick slots
- DataStore save integration
