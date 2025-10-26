-- GachaService.lua
-- Main gacha logic

local RarityConfig = require(script.Parent.RarityConfig)
local LuckService = require(script.Parent.LuckService)

local GachaService = {}

-- Performs a single gacha pull
-- playerStats = {luck, pity}
function GachaService.Pull(playerStats)
	local totalChance = 0
	for _, rarity in ipairs(RarityConfig) do
		totalChance += rarity.chance
	end

	local roll = math.random(1, totalChance)
	local cumulative = 0

	for _, rarity in ipairs(RarityConfig) do
		-- Calculate final chance using luck + pity
		local finalChance = LuckService.CalculateLuck(
			rarity.chance,
			playerStats.luck or 0,
			playerStats.pity or 0
		)

		cumulative += finalChance
		if roll <= cumulative then
			-- If rarity hit is rare or higher, reset pity
			if rarity.name ~= "Common" then
				playerStats.pity = LuckService.ResetPity()
			else
				playerStats.pity = LuckService.IncreasePity(playerStats.pity)
			end
			return rarity, playerStats
		end
	end

	-- Safety fallback
	return RarityConfig[1], playerStats
end

return GachaService
