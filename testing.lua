repeat wait(1) until game:IsLoaded()

print("this script was executed on rejoining")

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function()
    syn.queue_on_teleport([[game:HttpGet("https://raw.githubusercontent.com/d4rrrk/roblox-scripts/main/testing.lua")]])
end)
