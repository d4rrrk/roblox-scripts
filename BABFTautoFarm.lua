--// made by D4rk
local player = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
local vim = game:GetService("VirtualInputManager")
local bind = Instance.new("BindableFunction")
local version = "1.0"

if check then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Already executed";
        Text = "Leave to disable.";
        Duration = 3;
        Button1 = "Ok.";
    })
    return
end

getgenv().check = true

player.Idled:connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local tweenStartEnd = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tweenMiddle = TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

function playTweens()
    wait(1)
    workspace.BlackZone.VoteLaunchRE:FireServer()
    workspace.Gravity = 0
    local pos1 = tweenService:Create(player.Character.HumanoidRootPart, tweenStartEnd, {CFrame = CFrame.new(Vector3.new(-55, 50, 50))})
    local pos2 = tweenService:Create(player.Character.HumanoidRootPart, tweenMiddle, {CFrame = CFrame.new(Vector3.new(-55, 50, 8500))})
    local pos3 = tweenService:Create(player.Character.HumanoidRootPart, tweenStartEnd, {CFrame = CFrame.new(Vector3.new(-55, -360, 9500))})
    local pos4 = tweenService:Create(player.Character.HumanoidRootPart, tweenStartEnd, {CFrame = CFrame.new(Vector3.new(-55, -360, 9470))})
    
    pos1:Play()
    
    pos1.Completed:Connect(function()
        pos2:Play()
    end)
    
    pos2.Completed:Connect(function()
        pos3:Play()
    end)
    
    pos3.Completed:Connect(function()
        workspace.Gravity = 196
        wait(15)
        pos4:Play()
    end)
end

playTweens()

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    wait(3)
    workspace.Gravity = 0
    local claim = game:GetService("Players")[player.Name].PlayerGui.RiverResultsGui.Frame.BuyButton
    local x, y = claim.AbsolutePosition.X + claim.AbsoluteSize.X / 2, claim.AbsolutePosition.Y + claim.AbsoluteSize.Y / 2
    vim:SendMouseButtonEvent(x, y, 0, true, game, 0)
    vim:SendMouseButtonEvent(x, y, 0, false, game, 0)
    playTweens()
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Auto farm executed";
    Text = "Made by D4rk. Leave game to disable.\nV"..version;
    Duration = 10;
    Button1 = "Ok.";
})
game.StarterGui:SetCore("SendNotification", {
    Title = "Anti AFK Included";
    Text = "Feel free to leave this running in the background, anti afk is included.";
    Duration = 10;
    Button1 = "Ok.";
})
function bind.OnInvoke(response)
    if response == "Copy user." then
        setclipboard("D4rk#6293")
        wait(0.25)
        gameStarterGui:SetCore("SendNotification", {
        	Title = "Copied",
        	Text = "Username copied to clipboard.",
        	Duration = 3,
        	Button1 = "Ok.",
        })
    end
end
game.StarterGui:SetCore("SendNotification", {
	Title = "Bugs",
	Text = "If you find any bugs, please DM me on Discord.\nD4rk#6293",
	Duration = 10,
	Callback = bind,
	Button1 = "Ok.",
	Button2 = "Copy user."
})
