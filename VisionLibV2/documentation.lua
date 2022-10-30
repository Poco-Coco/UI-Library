local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua"))()

local Window = Library:Create({
	Name = "Vision UI Lib v2",
	Footer = "By Loco_CTO, Sius and BruhOOFBoi",
	ToggleKey = Enum.KeyCode.Return
})

local Tab = Window:Tab({
	Name = "Main",
	Icon = "rbxassetid://11396131982",
	Color = Color3.new(1, 0, 0)
})

local Section1 = Tab:Section({
	Name = "Basic controls"
})

local Button = Section1:Button({
	Name = "Button",
	Callback = function()
		print("Clicked")
	end
})

Button:SetName("New Button Name")

local Toggle = Section1:Toggle({
	Name = "Toggle",
	Default = true,
	Callback = function(Bool) 
		print(Bool)
	end
})

Toggle:SetName("New Toggle Name")
Toggle:Set(false)

local Section2 = Tab:Section({
	Name = "Advance controls"
})

local Slider = Section2:Slider({
	Name = "Slider",
	Max = 100,
	Min = 0,
	Default = 50,
	Callback = function() return end
})

Slider:SetValue(100)
Slider:SetName("New Slider Name")
