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

Blox Fruits distance checker
]]--

repeat wait(1) until game.Players.LocalPlayer.Character

game:GetService("RunService").RenderStepped:Connect(function()
	local otherPlayers = game:GetService("Players"):GetChildren()
	local player = game:GetService("Players").LocalPlayer
	for _, v in pairs(otherPlayers) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			local humPos = v.Character:FindFirstChild('HumanoidRootPart').Position
			local localPos = player.Character:FindFirstChild("HumanoidRootPart").Position
			local mag = math.round((localPos - humPos).Magnitude)
			if mag <= 500 then
				player:Kick("Player too close.")
				local webhook = 'https://discord.com/api/webhooks/1223047420418457601/1wql_gwg4ZRmHj8nWu2srosyFDZ5SI3Ullcvg05H0zo3QSwNsc5AOy0Pg1VcWjePJ4j4'
				local messageData = {
					["content"] = "@everyone server hopping :3"
				}
				messageData = game:GetService('HttpService'):JSONEncode(MessageData)
				game:GetService('HttpService'):PostAsync(webhook, messageData)
				wait(1)
			  	game:GetService("TeleportService"):Teleport(2753915549, player)
			end
		end
	end
end)
