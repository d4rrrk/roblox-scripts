-- Blox Fruits distance checker

repeat wait(1) until game.Players.LocalPlayer.Character

game:GetService("RunService").RenderStepped:Connect(function()
	local otherPlayers = game:GetService("Players"):GetChildren()
	local player = game:GetService("Players").LocalPlayer
	for _, v in pairs(otherPlayers) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			local humPos = v.Character:FindFirstChild('HumanoidRootPart').Position
			local localPos = player.Character:FindFirstChild("HumanoidRootPart").Position
			local mag = math.round((localPos - humPos).Magnitude)
			print(v.Name.."'s distance from you is "..mag.. " studs.")
			if mag <= 750 then
				player:Kick("Player too close.")
				wait(1)
			  game:GetService("TeleportService"):Teleport(2753915549, player)
			end
		end
	end
end)
