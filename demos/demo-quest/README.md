# Quest System Demo – Modular Mission Architecture
================================================

This project is a modular quest system for Roblox designed to support multiple quest types:
collect quests, kill quests, NPC interaction quests and more. It uses a flexible structure
that makes quests easy to expand and manage.

Features
--------
- Start / Progress / Complete quest lifecycle
- Supports multiple quest types (collect, kill, talk)
- Rewards system (coins, xp or custom)
- Client-server quest state sync
- Expandable architecture
- Clean Luau module design

How It Works
------------
- QuestDatabase defines available quests and requirements.
- QuestService stores quest progress for each player.
- QuestServer maintains server authority.
- QuestController handles client requests safely.
- QuestClient provides quest functions for UI and gameplay.

File Structure
--------------
demos/demo-quests/src
│
├── QuestDatabase.lua        -- Quest definitions
├── QuestService.lua         -- Quest logic
├── QuestServer.lua          -- Server authority
├── QuestRemotes.lua         -- Remote events & functions
├── QuestController.lua      -- Remote handler
├── QuestClient.lua          -- Client interface
└── QuestClientLoader.lua    -- Initialization script

Example Usage
-------------
-- Start quest
QuestClient:Start("quest_collect_apples")

-- Update quest progress
QuestClient:Progress("quest_collect_apples", 1)

-- Complete quest
QuestClient:Complete("quest_collect_apples")

Next Steps
----------
- UI quest tracker
- NPC dialog integration
- Quest chains (main quest + side quests)
- Save quest progress (DataStore)
