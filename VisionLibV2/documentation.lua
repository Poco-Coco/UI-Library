local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()

local Window = Library:Create({
	Name = "Vision UI Lib v2",
	Footer = "By Loco_CTO, Sius and BruhOOFBoi",
	ToggleKey = Enum.KeyCode.RightShift
})

Window:ChangeTogglekey(Enum.KeyCode.RightShift)

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
		Library:Notify({
			Name = "Button",
			Text = "Clicked",
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

Button:SetName("New Button Name")

local Toggle = Section1:Toggle({
	Name = "Toggle",
	Default = true,
	Callback = function(Bool) 
		Library:Notify({
			Name = "Toggle",
			Text = tostring(Bool),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
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
	Callback = function(Number)
		Library:Notify({
			Name = "Slider",
			Text = tostring(Number),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

Slider:SetValue(100)
Slider:SetName("New Slider Name")

local Keybind = Section2:Keybind({
	Name = "Keybind",
	Default = Enum.KeyCode.Return,
	Callback = function(Key)
		Library:Notify({
			Name = "Keybind pressed",
			Text = tostring(Key),
			Icon = "rbxassetid://11401835376",
			Duration = 3,
		})
	end,
	UpdateKeyCallback = function(Key)
		Library:Notify({
			Name = "Keybind updated",
			Text = tostring(Key),
			Icon = "rbxassetid://11401835376",
			Duration = 3,
		})
	end
})

Keybind:SetName("New keybind Name")

Library:Notify({
	Name = "Test",
	Text = "This is just a test",
	Icon = "rbxassetid://11401835376",
	Duration = 3,
	Callback = function()
		Library:Notify({
			Name = "Em",
			Text = "Notify Callback",
			Icon = "rbxassetid://11401835376",
			Duration = 3,
		})
	end
})
