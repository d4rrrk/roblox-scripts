repeat wait(1) until game.Players:IsLoaded()

if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("StartMenu") then
    game:GetService("Players").LocalPlayer.PlayerGui.StartMenu.Finish:FireServer()
end

syn.queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/RogueLineageDays.lua"))

local function hop(msg)
    game:GetService("StarterGui"):SetCore("PromptBlockPlayer", game.Players:GetPlayers()[math.random(2,#game.Players:GetPlayers())])
    wait(0.3)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(882, 640, 0, true, game, 0)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(883, 640, 0, false, game, 0)
    wait(0.5)
    game.Players.LocalPlayer:Kick(msg)
    wait(1)
    game:GetService("TeleportService"):Teleport(3016661674, game.Players.LocalPlayer)
end

for _, v in pairs(game:GetService("Players"):GetDescendants()) do
    if v:IsA("Tool") and v.Name == "Perflora" then
        hop("Druid in game.")
        return
    end
end

game:GetService("Players").DescendantAdded:Connect(function(item)
    if item.Name == "Perflora" and item:IsA("Tool") then
        hop("Druid in game.")
        return
    end
end)

game:GetService("Players").LocalPlayer.PlayerGui.StartMenu.Finish:FireServer()

game:GetService("RunService").RenderStepped:Connect(function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Character ~= nil then
            local distance = (v.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance <= 1000 then
                hop("Player too close.")
            end
        end
    end
end)
