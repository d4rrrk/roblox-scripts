if game.PlaceId ~= 5208655184 then
    syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/DruidCheck.lua"))()]])
    return
end

repeat wait(0.1) until game:IsLoaded();repeat wait(0.1) until game:GetService("Workspace"):FindFirstChild("Live")

local live = game:GetService("Workspace").Live
local player = game:GetService("Players").LocalPlayer
local virtualUser = game:GetService("VirtualUser")

player.Idled:connect(function()
    virtualUser:CaptureController()
    virtualUser:ClickButton2(Vector2.new())
end)

repeat wait(0.1) until game:GetService("Workspace").Live:FindFirstChild(player.Name)

live.DescendantAdded:Connect(function(tool)
    if tool:IsA("Tool") and tool.Name == "Perflora" or tool.Name == "Sagitta Sol" then
        player:Kick("Hopping Servers")
        wait(1)
        game:GetService("TeleportService"):Teleport(3016661674, player)
    end
end)

local hum = player.Character.Humanoid

hum:MoveTo(Vector3.new(1479, -105, -5750))
wait(1)
hum:MoveTo(Vector3.new(1479, -105, -5725))

print("200 OK")
syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/DruidCheck.lua"))()]])
