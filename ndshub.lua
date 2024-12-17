local version = "1.0.0"
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Snxdfer/back-ups-for-libs/refs/heads/main/Orion.lua')))()
local Window = OrionLib:MakeWindow({
    Name = "Natural Disaster Survival | v" ..version,
    IntroEnabled = true,
    IntroText = "Natural Disaster Survival Hub by 00Fazee | JuanchoLucas | elrandom",
    IntroIcon = "rbxassetid://10723345749",
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "NDS Hub by 00Fazee JuanchoLucas elrandom"
})

OrionLib:MakeNotification({
	Name = "NDS Hub",
	Content = "THIS SCRIPT WAS MADE BY: JuanchoLucas / elrandom / 00Fazee",
	Image = "rbxassetid://4483345998",
	Time = 10
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://10723407389",
	PremiumOnly = false
})
