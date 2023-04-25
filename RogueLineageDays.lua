if game.PlaceId == 3016661674 then 
    syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/RogueLineageDays.lua"))()]])
    return
end

repeat wait(0.1) until game:FindFirstChild("Players")

if not game:GetService("Players").LocalPlayer:FindFirstChild("Character") then
    game:GetService("Players").LocalPlayer.PlayerGui.StartMenu.Finish:FireServer()
end

game:GetService("RunService").RenderStepped:Connect(function()
    local live = game:GetService("Workspace").Live:GetChildren()
    local player = game:GetService("Players").LocalPlayer
    for _, v in pairs(live) do
        if v.Name ~= game.Players.LocalPlayer.Name and string.sub(v.Name, 1, 1) ~= "." then
            local humPos = v:FindFirstChild("HumanoidRootPart").Position
            local localPos = player.Character:FindFirstChild("HumanoidRootPart").Position
            local mag = math.round((localPos - humPos).Magnitude)
            print(v.Name.."'s distance from you is "..mag.. " studs.")
            if mag <= 1000 then
                player:Kick("Player too close.")
                wait(1)
                game:GetService("TeleportService"):Teleport(3016661674, player)
            end
        end
    end
end)

local hum = game:GetService("Players").LocalPlayer.Character.Humanoid

hum:MoveTo(Vector3.new(1479, -105, -5750))
wait(1)
hum:MoveTo(Vector3.new(1479, -105, -5725))

syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/RogueLineageDays.lua"))()]])
