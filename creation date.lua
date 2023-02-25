print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
local players = game:GetService("Players"):GetChildren()
local months = {
	"January", "Febuary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
}

for i, v in pairs(players) do
    local secondsExisted = v.accountAge * 86400
    local dateObject = os.date("!*t", os.time() - secondsExisted)
    print(v.Name.." joined ROBLOX on "..months[dateObject.month].." "..dateObject.day..", "..dateObject.year.." and their user ID is "..v.UserId)
    print(" ")
end