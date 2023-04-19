game:GetService("Players").LocalPlayer.PlayerGui.StartMenu.Finish:FireServer()

repeat wait(0.1) until game.Players.LocalPlayer:FindFirstChild("Character")

local distanceToLog = 1000

local players = game:GetService("Players")
local player = players.LocalPlayer
local live = game:GetService("Workspace").Live
local virtual = game:GetService("VirtualUser")
local run = game:GetService("RunService")

local function hop(msg)
    local vim = game:GetService("VirtualInputManager")
    game:GetService("StarterGui"):SetCore("PromptBlockPlayer", game.Players:GetPlayers()[math.random(2,#game.Players:GetPlayers())])
    wait(0.25)
    vim:SendMouseButtonEvent(882, 640, 0, true, game, 0)
    vim:SendMouseButtonEvent(883, 640, 0, false, game, 0)
    wait(0.5)
    player:Kick(msg)
    wait(1)
    game:GetService("TeleportService"):Teleport(3016661674, player) 
end

local function druidCheck()
    for _, v in pairs(players:GetPlayers()) do
        if v.Character then
            if v.Backpack:FindFirstChild("Perflora") or v.Character:FindFirstChild("Perflora") then
                hop("Druid in server...")
                break
            end
        end
    end
end

player.Idled:connect(function()
    virtual:CaptureController()
    virtual:ClickButton2(Vector2.new())
end)

local checkLoop = run.RenderStepped:Connect(function()
    druidCheck()
    for _, v in pairs(players:GetPlayers()) do
        local plrPos = player.Character.HumanoidRootPart.Position
        local otherPos = v.Character.HumanoidRootPart.Position
        local mag = (plrPos - otherPos).Magnitude
        if mag <= distanceToLog then
            hop("Player too close...")
            wait(1)
            game:GetService("TeleportService"):Teleport(3016661674, player)
            break
        end
    end
end)

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/RogueLineageDays.lua"))]])
end)
