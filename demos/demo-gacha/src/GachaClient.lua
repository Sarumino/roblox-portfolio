-- GachaClient.lua
-- Handles UI and server communication for gacha pulls

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = require(ReplicatedStorage:WaitForChild("GachaRemotes", 5) and ReplicatedStorage:WaitForChild("GachaRemotes") or script.Parent.Remotes)

local PullEvent = Remotes.PullRequest

local GachaClient = {}

-- Connect UI
function GachaClient.ConnectUI(ui)
	local pullBtn = ui:WaitForChild("PullButton")
	local resultLabel = ui:WaitForChild("ResultLabel")
	local pityLabel = ui:WaitForChild("PityLabel")

	pullBtn.MouseButton1Click:Connect(function()
		local result = PullEvent:InvokeServer()

		resultLabel.Text = "You got: " .. result.rarity
		resultLabel.TextColor3 = result.color

		pityLabel.Text = "Pity: " .. result.pity
	end)
end

return GachaClient
