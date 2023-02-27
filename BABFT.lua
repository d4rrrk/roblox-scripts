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

OrionLib:MakeNotification({
    Name = "Build A Boat For Treasure",
    Content = "Made by D4rk#6293",
    Time = 5
})

local autofarm = false
local version = "1.1"
getgenv().executedCheck = false
getgenv().player = game:GetService("Players").LocalPlayer
getgenv().tweenService = game:GetService("TweenService")
getgenv().tweenStartEnd = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
getgenv().tweenMiddle = TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
getgenv().water = game:GetDescendants()

local Window = OrionLib:MakeWindow({Name = "Build A Boat For Treasure", HidePremium = false, SaveConfig = true, ConfigFolder = "MadeByD4rk"})

local AutoFarmTab = Window:MakeTab({
	Name = "Auto Farm",
	PremiumOnly = false
})

local AutoFarmSection = AutoFarmTab:AddSection({
	Name = "Auto Farm"
})

function playTweens()
    local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    wait(1)
    workspace.BlackZone.VoteLaunchRE:FireServer()
    workspace.Gravity = 0
    local pos1 = tweenService:Create(root, tweenStartEnd, {CFrame = CFrame.new(Vector3.new(-55, 50, 50))})
    local pos2 = tweenService:Create(root, tweenMiddle, {CFrame = CFrame.new(Vector3.new(-55, 50, 8500))})
    local pos3 = tweenService:Create(root, tweenStartEnd, {CFrame = CFrame.new(Vector3.new(-55, -360, 9500))})
    local pos4 = tweenService:Create(root, tweenStartEnd, {CFrame = CFrame.new(Vector3.new(-55, -360, 9470))})
    pos1:Play()
    
    pos1.Completed:Connect(function()
        pos2:Play()
    end)
    
    pos2.Completed:Connect(function()
        pos3:Play()
    end)
    
    pos3.Completed:Connect(function()
        wait(12)
        pos4:Play()
    end)
end

local autofarm = false

AutoFarmSection:AddToggle({
    Name = "Auto farm",
    Default = false,
    Callback = function(value)
        autofarm = value
        if autofarm == true then
            playTweens()
            game.Players.LocalPlayer.CharacterAdded:Connect(function()
                if autofarm then
                    playTweens() 
                end
            end)
        elseif autofarm == false then
            if executedCheck then
                workspace.Gravity = 196
                player.Character:BreakJoints()
                OrionLib:MakeNotification({
                    Name = "Auto farm disabled",
                    Content = "Auto farm has been disabled.",
                    Time = 5
                })
            end
        end
    end
})

AutoFarmSection:AddButton({
    Name = "Anti AFK",
    Callback = function()
        player.Idled:connect(function()
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):ClickButton2(Vector2.new())
        end)
        OrionLib:MakeNotification({
            Name = "Anti AFK executed",
            Content = "You may leave the game running in the background.",
            Time = 5
        })
    end
})

local LocalPlayerTab = Window:MakeTab({
	Name = "Local Player",
	PremiumOnly = false
})

local LocalPlayerSection = LocalPlayerTab:AddSection({
	Name = "Local Player"
})

LocalPlayerTab:AddSlider({
	Name = "Walkspeed",
	Min = 16,
	Max = 250,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		player.Character:WaitForChild("Humanoid").WalkSpeed = Value
	end    
})

LocalPlayerTab:AddSlider({
	Name = "Jump power",
	Min = 50,
	Max = 250,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump",
	Callback = function(Value)
		player.Character:WaitForChild("Humanoid").JumpPower = Value
	end    
})

LocalPlayerTab:AddSlider({
	Name = "Gravity",
	Min = 0,
	Max = 1000,
	Default = 196,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
		workspace.Gravity = Value
	end    
})

LocalPlayerTab:AddButton({
    Name = "Reset gravity",
    Callback = function()
        workspace.Gravity = 196
    end
})

LocalPlayerTab:AddButton({
    Name = "Reset player",
    Callback = function()
        player.Character:BreakJoints()
    end
})

local MiscTab = Window:MakeTab({
	Name = "Misc.",
	PremiumOnly = false
})

local MiscSection = MiscTab:AddSection({
	Name = "Miscellaneous"
})

MiscSection:AddButton({
    Name = "Remove water",
    Callback = function()
        for _, v in pairs(water) do
            if v.Name == "Water" and v:IsA("Part") then
                v:Destroy() 
            end
        end
        OrionLib:MakeNotification({
        	Name = "Water removed",
        	Content = "Water has been deleted.",
        	Time = 5
        })
    end
})

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
        if autofarm == true then
            autofarm = false
            player.Character:BreakJoints()
            workspace.Gravity = 196
        end
  	end
})

SettingsSection:AddButton({
	Name = "Made by D4rk#6293",
	Callback = function()
        setclipboard("D4rk#6293")
        OrionLib:MakeNotification({
        	Name = "Username copied",
        	Content = "Discord username copied to clipboard.",
        	Time = 5
        })
  	end
})

getgenv().executedCheck = true

OrionLib:Init()
