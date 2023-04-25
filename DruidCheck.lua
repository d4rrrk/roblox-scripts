if game.PlaceId == 3016661674 then
    syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/DruidCheck.lua"))()]])
    return
end

wait(15)

local live = game:GetService("Workspace").Live

live.DescendantAdded:Connect(function(tool)
    if tool:IsA("Tool") and tool.Name == "Perflora" or tool.Name == "Sagitta Sol" then
        game:GetService("Players").LocalPlayer:Kick("Hopping Servers")
        wait(1)
        game:GetService("TeleportService"):Teleport(3016661674, player)
    end
end)

syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/DruidCheck.lua"))()]])
