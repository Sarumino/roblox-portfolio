# Gacha System Demo – Luck and Pity Architecture

This is a modular Gacha System written in Luau for Roblox. It uses server-authoritative logic with Luck and Pity mechanics to improve fairness and prevent bad luck streaks. The architecture is lightweight, expandable and easy to integrate into simulator, RPG or loot-based Roblox games.

Features:
- Configurable rarity system
- Luck system that increases chance over time
- Pity system to guarantee better rewards over time
- Server-authoritative pull logic
- RemoteFunction client-server communication
- Clean ModuleScript architecture
- UI-ready structure

File Structure:
ReplicatedStorage
└── Modules
    └── Gacha
        ├── RarityConfig.lua
        ├── LuckService.lua
        ├── GachaService.lua
        ├── Remotes.lua
        └── GachaClient.lua

ServerScriptService
└── GachaServer.lua

StarterPlayer
└── StarterPlayerScripts
    └── GachaClientLoader.lua

Example Pull Logic (Server):
local result, updatedStats = GachaService.Pull(playerStats)
return {
    rarity = result.name,
    color = result.color,
    pity = updatedStats.pity
}

How It Works:
- RarityConfig defines rewards and drop chances
- LuckService increases probability by player luck
- Pity ensures fair reward progression
- GachaService handles the pull algorithm
- GachaServer ensures server authority
- Remotes manages safe communication
- GachaClient connects UI and logic

Setup Instructions:
1. Copy the folders to the same locations shown above inside your Roblox game.
2. Add a Gacha button in UI and connect it with:
   local result = Remotes.PullRequest:InvokeServer()
3. Display the pull result in UI using result.rarity and result.pity.

Future Improvements:
- Multi pull (10x, 50x)
- Pet/item integration
- Visual effects and animations
- Sound effects
- DataStore saving
