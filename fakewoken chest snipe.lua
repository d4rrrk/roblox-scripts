getgenv().player = game:GetService("Players").LocalPlayer
getgenv().chest = game:GetService("Workspace").Thrown:GetChildren()
getgenv().vim = game:GetService("VirtualInputManager")
getgenv().uis = game:GetService("UserInputService")
local Noclip = nil
local Clip = nil

game.StarterGui:SetCore("SendNotification", {
    Title = "Made by D4rk";
    Text = "eat shit and die.";
    Duration = math.huge;
})

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21)
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

if chestFarm == true then
    noclip()
elseif chestFarm == false then
    clip()
end

while chestFarm == true do wait()
    getgenv().chest = game:GetService("Workspace").Thrown:GetChildren()
    for _, v in pairs(chest) do
        if v.Name ~= "Model" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9923, 608, -7161)
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Part.Position.X, v.Part.Position.Y - 8, v.Part.Position.Z)
            vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
            vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            if game:GetService("Players")[player.Name].PlayerGui:FindFirstChild("ChoicePrompt") then
                local choices = game:GetService("Players")[player.Name].PlayerGui.ChoicePrompt.ChoiceFrame.Options:GetChildren()
                for _, v in pairs(choices) do
                    local item = v
                    game:GetService("Players").LocalPlayer.PlayerGui.ChoicePrompt.Choice:FireServer(tostring(item))
                end
            else end
        end
    end
end

if Noclip then
    Noclip:Disconnect()
end