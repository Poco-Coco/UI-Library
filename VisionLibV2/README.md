![Vison Lib Title only](https://user-images.githubusercontent.com/112562956/198860495-6f486850-4919-4b28-9692-6b4125ae116c.png)

# Vision UI Lib v2
- Desigend by Sius and BruhOOFBoi
- Scripted by Loco_CTO

*Heavily inspired by [Rayfield UI Library](https://github.com/shlexware/Rayfield/blob/main/Documentation.md)*

## Preview
![image](https://user-images.githubusercontent.com/112562956/198860516-a5f74c21-d911-4bed-aabc-06e350faeae0.png)

**:warning: The UI Library is still under development, not all functions in the preview are included.**


## 🔴Loading the library
```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()
```

## 🟡Creating a Notify
```lua
Library:Notify({
	Name = "Ring Ring", -- String
	Text = "Notification!!", -- String
	Icon = "rbxassetid://11401835376", -- String
	Duration = 5, -- Integer
	Callback = function()
		-- Function
	end
})
```

## 🟡Creating a Window
```lua
local Window = Library:Create({
	Name = "Vision UI Lib v2", -- String
	Footer = "By Loco_CTO, Sius and BruhOOFBoi", -- String
	ToggleKey = Enum.KeyCode.RightShift, -- Enum.KeyCode
	KeySystem = true, -- Boolean
	Key = "keyabc123", -- String
	MaxAttempts = 5, -- Integer
	DiscordLink = "https://discord.gg/Bp7wFcZeUn" -- String (Set it to nil if you do not have one, the button will not pop out)
})
```
### Updating toggle key
```lua
Window:ChangeTogglekey(Enum.KeyCode.LeftAlt) -- Enum.KeyCode
```

## 🔵Creating a Tab
```lua
local Tab = Window:Tab({
	Name = "Main", -- String
	Icon = "rbxassetid://11396131982", -- String
	Color = Color3.new(1, 0, 0) -- Color3
})
```

## 🟢Creating a Section
```lua
local Section = Tab:Section({
	Name = "Section" -- String
})
```

## 🟣Creating a Button
```lua
local Button = Section1:Button({
	Name = "Button", -- String
	Callback = function()
		-- Function
	end
})
```

### Updating button name
```lua
Button:SetName("New Button Name") -- String
```

## 🟣Creating a Toggle
```lua
local Toggle = Section:Toggle({
	Name = "Toggle", -- String
	Default = true, -- Boolean
	Callback = function(Bool) 
		-- Function
	end
})
```

### Updating toggle name
```lua
Toggle:SetName("New Toggle Name") -- String
```

### Updating toggle value
```lua
Toggle:Set(false) -- Boolean
```

## 🟣Creating a Slider
```lua
local Slider = Section:Slider({
	Name = "Slider", -- String
	Max = 100, -- Integer
	Min = 0, -- Integer
	Default = 50, -- Integer
	Callback = function(Value)
    		-- Function
  	end
})
```

### Updating slider name
```lua
Slider:SetName("New Slider Name") -- String
```

### Updating slider value
```lua
Slider:SetValue(100) -- Integer
```

## 🟣Creating a Keybind
```lua
local Keybind = Section2:Keybind({
	Name = "Keybind",
	Default = Enum.KeyCode.Return,
	Callback = function()
		-- Function
	end,
	UpdateKeyCallback = function(Key)
		-- Function
	end
})
```

### Updating keybind name
```lua
Keybind:SetName("New keybind Name") -- String
```

## ⚪Use this to test
```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()

local Window = Library:Create({
	Name = "Vision UI Lib v2",
	Footer = "By Loco_CTO, Sius and BruhOOFBoi",
	ToggleKey = Enum.KeyCode.RightShift,
	KeySystem = true,
	Key = "keyabc123",
	MaxAttempts = 5,
	DiscordLink = "https://discord.gg/Bp7wFcZeUn"
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
	Callback = function()
		Library:Notify({
			Name = "Keybind pressed",
			Text = "Idk sth here",
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
```

##### Created and mantained by Core Vision, Discord: https://discord.gg/Bp7wFcZeUn
