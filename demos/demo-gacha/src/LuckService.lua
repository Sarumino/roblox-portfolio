-- LuckService.lua
-- Handles luck bonuses and pity system for gacha pulls

local LuckService = {}

-- Calculates new luck chance using base rarity + player luck + pity
function LuckService.CalculateLuck(baseChance, playerLuck, pityCount)
	-- Base formula example
	local luckBonus = playerLuck * 0.2  -- Each Luck = +0.2% chance
	local pityBonus = math.min(pityCount * 0.1, 10) -- Max +10% from pity

	return baseChance + luckBonus + pityBonus
end

-- Increase pity for losing streak
function LuckService.IncreasePity(pityCount)
	return pityCount + 1
end

-- Reset pity after a win
function LuckService.ResetPity()
	return 0
end

return LuckService
