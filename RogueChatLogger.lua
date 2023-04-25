repeat wait(0.25) until game:GetService("Players"):FindFirstChild(LocalPlayer)

rconsolename("Chat logger")
rconsoleprint("")
rconsoleclear()

local players = game:GetService("Players")
local live = game:GetService("Workspace").Live

local checkTool = "Observe"

for _, v in pairs(players:GetPlayers()) do
    v.Chatted:Connect(function(msg)
        if v.Character ~= nil and v.Character:FindFirstChild("Torso") then
            if v.Character:FindFirstChild(checkTool) or v.Backpack:FindFirstChild(checkTool) then
                rconsoleprint("@@YELLOW@@")
                rconsoleprint(os.date("%H:%M:%S | ")..v.Name..": "..tostring(msg).."\n")
            else
                rconsoleprint("@@WHITE@@")
                rconsoleprint(os.date("%H:%M:%S | ")..v.Name..": "..tostring(msg).."\n")
            end
        else
            rconsoleprint("@@RED@@")
            rconsoleprint("(In menu) "..os.date("%H:%M:%S | ")..v.Name..": "..tostring(msg).."\n")
        end
    end)
end

players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        if plr.Character ~= nil and plr.Character:FindFirstChild("Torso") then
            if plr.Character:FindFirstChild(checkTool) or plr.Backpack:FindFirstChild(checkTool) then
                rconsoleprint("@@YELLOW@@")
                rconsoleprint(os.date("%H:%M:%S | ")..plr.Name..": "..tostring(msg).."\n")
            else
                rconsoleprint("@@WHITE@@")
                rconsoleprint(os.date("%H:%M:%S | ")..plr.Name..": "..tostring(msg).."\n")
            end
        else
            rconsoleprint("@@RED@@")
            rconsoleprint("(In menu) "..plr.Name..": "..tostring(msg).."\n")
        end
    end)
end)

syn.queue_on_teleport(loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/RogueChatLogger.lua"))())
