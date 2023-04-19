repeat wait(1) until game:IsLoaded()

syn.queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/RogueLineageDays.lua"))

game:GetService("Players").LocalPlayer.PlayerGui.StartMenu.Finish:FireServer()

repeat wait(1) until game:GetService("Players").LocalPlayer:FindFirstChild("Character")

local function druidCheck()
    for _, v in pairs(players:GetPlayers()) do
        if v.Character then
            if v.Backpack:FindFirstChild("Perflora") or v.Character:FindFirstChild("Perflora") then
                hop("Druid "..(v.Name).." in server...")
                break
            end
        end
    end
end

local function hop(msg)
    game:GetService("StarterGui"):SetCore("PromptBlockPlayer", game.Players:GetPlayers()[math.random(2,#game.Players:GetPlayers())])
    wait(0.25)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(882, 640, 0, true, game, 0)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(883, 640, 0, false, game, 0)
    wait(0.25)
    game.Players.LocalPlayer:Kick(msg)
    wait(0.5)
    game:GetService("TeleportService"):Teleport(3016661674, game.Players.LocalPlayer)
end

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local loop = game:GetService("RunService").RenderStepped:Connect(function()
    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local root = player.Character.HumanoidRootPart
    
    for _, v in pairs(players:GetChildren()) do
        if string.sub(v.Name, 1, 1) ~= "." and v.Name ~= game.Players.LocalPlayer.Name then
            if v.Character ~= nil then
                local rootPos = root.Position
                local otherPos = v.Character.HumanoidRootPart.Position
                local mag = math.round((rootPos - otherPos).Magnitude)
                if mag <= 1000 then
                    hop("Player ("..v.Name..") too close.")
                    loop:Disconnect()
                end
            end
        end
    end
end)
