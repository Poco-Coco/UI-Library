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

### Destroy the library
```lua
Library:Destroy()
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
	LoadedCallback = function()
		-- Function
	end,
	
	KeySystem = true, -- Boolean
	Key = "keyabc123", -- String
	MaxAttempts = 5, -- Integer
	DiscordLink = "https://discord.gg/Bp7wFcZeUn", -- String (Set it to nil if you do not have one, the button will not pop out)
	ToggledRelativeY = 0.5 -- Number (0-1, set it to nil if you want it to be centred)
})
```
### Updating toggle key
```lua
Window:ChangeTogglekey(Enum.KeyCode.LeftAlt) -- Enum.KeyCode
```

### Toggle UI
```lua
Window:Toggled(true) -- Boolean
```

### Updating toggle taskbar only
```lua
Window:TaskBarOnly(true) -- Boolean
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

## 🟣Creating a Small Textbox
```lua
local SmallTextbox = Section2:SmallTextbox({
	Name = "Small Textbox", -- String
	Default = "Default Text", -- String
	Callback = function(Text)
		-- Function
	end
})
```

### Updating small textbox name
```lua
SmallTextbox:SetName("New Textbox name") -- String
```

### Updating small textbox text
```lua
SmallTextbox:SetText("Another text") -- String
```

## 🟣Creating a Dropdown
```lua
local Dropdown = Section2:Dropdown({
	Name = "Dropdown", -- String
	Items = {1, 2, 3, 4, "Item"}, -- Table
	Callback = function(item)
		-- Function
	end
})
```

### Updating a Dropdown
```lua
Dropdown:UpdateList({
	Items = {"New item", 1, 2, 3}, -- Table
	Replace = true -- Boolean (Clear all items in the dropdown)
})
```

### Adding an item to dropdown
```lua
Dropdown:AddItem("Item") -- String, Integer, Instance
```

### Clear the dropdown
```lua
Dropdown:Clear()
```

## ⚪Use this to test
```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()

Window = Library:Create({
	Name = "Vision UI Lib v2",
	Footer = "By Loco_CTO, Sius and BruhOOFBoi",
	ToggleKey = Enum.KeyCode.RightShift,
	LoadedCallback = function()
		Window:TaskBarOnly(true)
	end,
	KeySystem = false,
	Key = "123456",
	MaxAttempts = 5,
	DiscordLink = nil,
	ToggledRelativeY = 0.62
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

local Toggle = Section1:Toggle({
	Name = "Toggle",
	Default = false,
	Callback = function(Bool) 
		Library:Notify({
			Name = "Toggle",
			Text = tostring(Bool),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

local Section2 = Tab:Section({
	Name = "Advance controls"
})

local Slider = Section2:Slider({
	Name = "Slider",
	Max = 50,
	Min = 0,
	Default = 25,
	Callback = function(Number)
		Library:Notify({
			Name = "Slider",
			Text = tostring(Number),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
	end
})

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

local SmallTextbox = Section2:SmallTextbox({
	Name = "Small Textbox",
	Default = "Default Text",
	Callback = function(Text)
		Library:Notify({
			Name = "Small Textbox updated",
			Text = Text,
			Icon = "rbxassetid://11401835376",
			Duration = 3,
		})
	end
})

local Dropdown = Section2:Dropdown({
	Name = "Dropdown",
	Items = {1, 2, 3, 4, "XD"},
	Callback = function(item)
		print(typeof(item))
		print(item)
	end
})

local Button = Section2:Button({
	Name = "Clear dropdown",
	Callback = function()
		Dropdown:Clear()
	end
})

local Button = Section2:Button({
	Name = "Update dropdown",
	Callback = function()
		Dropdown:UpdateList({
			Items = {"bruh", 1, 2, 3},
			Replace = true
		})
	end
})

local Button = Section2:Button({
	Name = "Additem",
	Callback = function()
		Dropdown:AddItem("Item")
	end
})

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

local Tab = Window:Tab({
	Name = "Others",
	Icon = "rbxassetid://11476626403",
	Color = Color3.new(0.474509, 0.474509, 0.474509)
})

local Section = Tab:Section({
	Name = "Miscs"
})

local Button = Section:Button({
	Name = "Destroy library",
	Callback = function()
		Library:Destroy()
	end
})

local Button = Section:Button({
	Name = "Hide UI",
	Callback = function()
		Window:Toggled(false)
		
		task.wait(3)
		
		Window:Toggled(true)
	end
})

local Button = Section:Button({
	Name = "Task Bar Only",
	Callback = function()
		Window:TaskBarOnly(true)

		task.wait(3)

		Window:TaskBarOnly(false)
	end
})
```

##### Created and mantained by Core Vision, Discord: https://discord.gg/Bp7wFcZeUn
