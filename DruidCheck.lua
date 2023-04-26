if game.PlaceId == 3016661674 then
    syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/DruidCheck.lua"))()]])
    return
end

repeat wait(0.1) until game:IsLoaded();repeat wait(0.1) until game:GetService("Workspace"):FindFirstChild("Live")

local live = game:GetService("Workspace").Live
local player = game:GetService("Players").LocalPlayer

live.DescendantAdded:Connect(function(tool)
    if tool:IsA("Tool") and tool.Name == "Perflora" or tool.Name == "Sagitta Sol" then
        player:Kick("Hopping Servers")
        wait(1)
        game:GetService("TeleportService"):Teleport(3016661674, player)
    end
end)

print("ok")
syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/DruidCheck.lua"))()]])
