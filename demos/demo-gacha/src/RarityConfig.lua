-- RarityConfig.lua
-- Defines the rarity tiers and base drop chances for the gacha system

local RarityConfig = {
	{ name = "Common", chance = 70, color = Color3.fromRGB(180, 180, 180) },
	{ name = "Rare", chance = 20, color = Color3.fromRGB(86, 125, 255) },
	{ name = "Epic", chance = 8, color = Color3.fromRGB(168, 50, 255) },
	{ name = "Legendary", chance = 2, color = Color3.fromRGB(255, 200, 62) }
}

return RarityConfig
