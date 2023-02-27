--[[
DDDDDDDDDDDDD               444444444                     kkkkkkkk           
D::::::::::::DDD           4::::::::4                     k::::::k           
D:::::::::::::::DD        4:::::::::4                     k::::::k           
DDD:::::DDDDD:::::D      4::::44::::4                     k::::::k           
  D:::::D    D:::::D    4::::4 4::::4  rrrrr   rrrrrrrrr   k:::::k    kkkkkkk
  D:::::D     D:::::D  4::::4  4::::4  r::::rrr:::::::::r  k:::::k   k:::::k 
  D:::::D     D:::::D 4::::4   4::::4  r:::::::::::::::::r k:::::k  k:::::k  
  D:::::D     D:::::D4::::444444::::444rr::::::rrrrr::::::rk:::::k k:::::k   
  D:::::D     D:::::D4::::::::::::::::4 r:::::r     r:::::rk::::::k:::::k    
  D:::::D     D:::::D4444444444:::::444 r:::::r     rrrrrrrk:::::::::::k     
  D:::::D     D:::::D          4::::4   r:::::r            k:::::::::::k     
  D:::::D    D:::::D           4::::4   r:::::r            k::::::k:::::k    
DDD:::::DDDDD:::::D            4::::4   r:::::r           k::::::k k:::::k   
D:::::::::::::::DD           44::::::44 r:::::r           k::::::k  k:::::k  
D::::::::::::DDD             4::::::::4 r:::::r           k::::::k   k:::::k 
DDDDDDDDDDDDD                4444444444 rrrrrrr           kkkkkkkk    kkkkkkk
]]--

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

if game.PlaceId == 10138901829 then
    OrionLib:MakeNotification({
    	Name = "Execute in-game",
    	Content = "Load into the game, and then execute.",
    	Time = 5
    })
    return
elseif game.PlaceId == 10371908957 then
    OrionLib:MakeNotification({
    	Name = "Deepwoken Dev",
    	Content = "Made by D4rk#6293",
    	Time = 5
    })
end

local chestStealerOn = false
local chestAutoLoot = false
getgenv().player = game:GetService("Players").LocalPlayer
getgenv().chest = game:GetService("Workspace").Thrown:GetChildren()
getgenv().vim = game:GetService("VirtualInputManager")

local Window = OrionLib:MakeWindow({Name = "Deepwoken Dev", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion"})

local PlayerTab = Window:MakeTab({
	Name = "Auto farm",
	PremiumOnly = false
})

local PlayerSection = PlayerTab:AddSection({
	Name = "Auto farm"
})

PlayerSection:AddToggle({
    Name = "Chest stealer",
    Default = false,
    Callback = function(value)
        chestStealerOn = value
    end    
})

game:GetService("RunService").RenderStepped:Connect(function()
    if chestStealerOn then
        getgenv().chest = game:GetService("Workspace").Thrown:GetChildren()
        for _, v in pairs(chest) do
            if v.Name ~= "Model" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9923, 608, -7161)
            else
                getgenv().chestPart = v:WaitForChild("Part")
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chestPart.Position.X, chestPart.Position.Y - 8, chestPart.Position.Z)
                vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            end
        end
    end
    if game:GetService("Players")[player.Name].PlayerGui:FindFirstChild("ChoicePrompt") then
        
    else
        local choices = game:GetService("Players")[player.Name].PlayerGui:WaitForChild("ChoicePrompt").ChoiceFrame.Options:GetChildren()
        for _, v in pairs(choices) do
            local item = v
            game:GetService("Players").LocalPlayer.PlayerGui.ChoicePrompt.Choice:FireServer(tostring(item))
        end
    end
end)

PlayerSection:AddToggle({
    Name = "Auto loot chests",
    Default = false,
    Callback = function(value)
        chestAutoLoot = value
    end    
})

game:GetService("RunService").RenderStepped:Connect(function()
    if chestAutoLoot then
        local chest = game:GetService("Workspace").Thrown:GetChildren()
        for _, v in pairs(chest) do
            if v.Name ~= "Model" then
                
            elseif v.Name == "Campfire" then
                
            else
                local chestPart = v:WaitForChild("Part")
                local chestPos = v.Part.Position
                local distance = math.round((chestPos - game.Workspace.Live[player.Name]:WaitForChild("HumanoidRootPart").Position).Magnitude)
            end
        end
        if tonumber(distance) ~= nil then
            if tonumber(distance) <= 10 then
                vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            else
                return
            end
        end
        local choiceAutoLoot = game:GetService("Players")[player.Name].PlayerGui:WaitForChild("ChoicePrompt")
        if choiceAutoLoot then
            local choicesAutoLoot = game:GetService("Players")[player.Name].PlayerGui.ChoicePrompt.ChoiceFrame.Options:GetChildren()
            for _, v in pairs(choicesAutoLoot) do
                local item = v
                game:GetService("Players").LocalPlayer.PlayerGui.ChoicePrompt.Choice:FireServer(tostring(item))
            end
        else
            return
        end
    else
        return
    end
end)

local SettingsTab = Window:MakeTab({
	Name = "Settings",
	PremiumOnly = false
})

local SettingsSection = SettingsTab:AddSection({
	Name = "Settings"
})

SettingsSection:AddButton({
	Name = "Destroy UI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})

OrionLib:Init() --UI Lib End
