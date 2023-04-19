repeat wait(1) until game:IsLoaded()

print("this script was executed on rejoining")

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/testing.lua"))()]])
    end
end)
