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
	Name = "Mega Mansion Tycoon",
	Content = "Made by D4rk#6293",
	Time = 5
})

getgenv().executedCheck = false
getgenv().player = game:GetService("Players").LocalPlayer
getgenv().root = player.Character:WaitForChild("HumanoidRootPart")
getgenv().tycoons = game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons:GetChildren()
getgenv().virtualUser = game:GetService("VirtualUser")

for _, v in pairs(tycoons) do
    if v:FindFirstChild("Owner") then
        getgenv().owner = v.Owner
        if owner.Value == nil then
            
        elseif tostring(owner.Value) == player.Name then
            getgenv().playerTycoon = v
            if playerTycoon.Essentials:FindFirstChild("Giver") then
                getgenv().collect = playerTycoon.Essentials.Giver
            else
                getgenv().collect = playerTycoon.PurchasedObjects.Level2.level1finished.Giver
            end
            getgenv().buttons = playerTycoon.Buttons:GetDescendants()
            getgenv().cash = game:GetService("Players")[player.Name].leaderstats.Cash.Value
        end
    end
end

local Window = OrionLib:MakeWindow({Name = "Mega Mansion Tycoon", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion"})

local AutoFarmTab = Window:MakeTab({
	Name = "Auto Farm",
	PremiumOnly = false
})

local AutoFarmSection = AutoFarmTab:AddSection({
	Name = "Auto Farm"
})

local autoCollect = false
local autoCollecting = nil

AutoFarmSection:AddToggle({
    Name = "Auto collect",
    Default = false,
    Callback = function(value)
        getgenv().root = player.Character:WaitForChild("HumanoidRootPart")
        autoCollect = value
        if autoCollecting == nil then
            autoCollecting = game:GetService("RunService").RenderStepped:Connect(function()
                if autoCollect then
                    firetouchinterest(root, collect, 0)
                    firetouchinterest(root, collect, 1)
                elseif executedCheck == true then
                    autoCollecting:Disconnect()
                    autoCollecting = nil
                end
            end)
        end
    end
})

player.CharacterAdded:Connect(function()
    getgenv().root = player.Character:WaitForChild("HumanoidRootPart")
end)

local autoBuy = false
local autoBuying = nil

AutoFarmSection:AddToggle({
    Name = "Auto buy",
    Default = false,
    Callback = function(value)
        autoBuy = value
        if autoBuying == nil then
            autoBuying = game:GetService("RunService").RenderStepped:Connect(function()
                if autoBuy then
                    getgenv().cash = game:GetService("Players")[player.Name].leaderstats.Cash.Value
                    getgenv().buttons = playerTycoon.Buttons:GetDescendants()
                    for _, v in pairs(buttons) do
                        if v.Name == "Head" and v:FindFirstChild("TouchInterest") or v:FindFirstChild("TouchTransmitter") then
                            getgenv().price = v.Parent.Price.Value
                            if price == nil or cash == nil then
                            
                            elseif price <= cash then
                                getgenv().button = v
                                firetouchinterest(player.Character.HumanoidRootPart, button, 0)
                                firetouchinterest(player.Character.HumanoidRootPart, button, 1)
                                return
                            end
                        end
                    end
                elseif executedCheck == true then
                    autoBuying:Disconnect()
                    autoBuying = nil
                end
            end)
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
	Name = "Jump height",
	Min = 7,
	Max = 250,
	Default = 7,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump",
	Callback = function(Value)
		player.Character:WaitForChild("Humanoid").JumpHeight = Value
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
        if autoCollect == true then
            autoCollect = false
            if autoBuying ~= nil then
                autoCollecting:Disconnect()
            end
        elseif autoBuy == true then
            autoBuy = false
            if autoBuying ~= nil then
                autoBuying:Disconnect()
            end
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
