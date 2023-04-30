if game.PlaceId ~= 5208655184 then
    syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/AutoCowl.lua"))()]])
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

player.Character.Humanoid:EquipTool(player.Backpack:WaitForChild("Dark Cowl"))
wait(1)
local vim = game:GetService("VirtualInputManager")
vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
wait(0.1)
vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
  
print("200 OK")
syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/AutoCowl.lua"))()]])
