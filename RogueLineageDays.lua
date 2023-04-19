repeat wait(0.1) until game:IsLoaded()

game:GetService("Players").LocalPlayer.PlayerGui.StartMenu.Finish:FireServer()

repeat wait(0.1) until game.Players.LocalPlayer:FindFirstChild("Character")

local logDist = 1000

local players = game:GetService("Players")
local player = players.LocalPlayer
local live = game:GetService("Workspace").Live
local virtual = game:GetService("VirtualUser")

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

local function ping(msg)
    local hook = "https://discord.com/api/webhooks/1098287215169261670/QA7dJsapdy5TmvWYvren1WuMCOvrkz-RA7l-e1MUGV8s3kFcowLovSS7Hm_RNB-3t7eN"
    
    syn.request({
        Url = hook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
            Body = game:GetService("HttpService"):JSONEncode({content = msg})
    })
end

local function dayCheck()
    local lives = game:GetService("Players").chappedLips609.PlayerGui.StatGui.Container.Health.Lives
    
    local days = {}
    
    for i, v in pairs(lives:GetChildren()) do
        if v.Name ~= "Back" then
            if i ~= 2 then
                table.insert(days, v.Char.Text)
            end
        end
    end
    
    local str = table.concat(days)
    
    ping("Current number of days: "..str)
end

dayCheck()

player.Idled:connect(function()
    virtual:CaptureController()
    virtual:ClickButton2(Vector2.new())
end)

syn.queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/RogueLineageDays.lua"))

local check = game:GetService("RunService").RenderStepped:Connect(function()
    druidCheck()
    local players = game:GetService("Players")
    local player = players.LocalPlayer
    for _, v in pairs(players:GetPlayers()) do
        if v.Name ~= player.Name then
            local plrPos = player.Character.HumanoidRootPart.Position
            local otherPos = v.Character.HumanoidRootPart.Position
            local mag = (plrPos - otherPos).Magnitude
            if mag <= logDist then
                logDist = mag
                closestPlayer = v.Name
            end
        end
    end
    
    if closestPlayer then
        hop("Player ("..closestPlayer..") too close")
        wait(10)
    end
end)
