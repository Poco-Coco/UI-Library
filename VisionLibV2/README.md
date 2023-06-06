![Vison Lib Title only](https://user-images.githubusercontent.com/112562956/198860495-6f486850-4919-4b28-9692-6b4125ae116c.png)

# Vision UI Lib v2

- Desigend by Sius and BruhOOFBoi
- Scripted by Loco_CTO

_Heavily inspired by [Rayfield UI Library](https://github.com/shlexware/Rayfield/blob/main/Documentation.md)_

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
	Sound = "rbxassetid://6647898215", -- String
	Duration = 5, -- Integer
	Callback = function()
		-- Function
	end
})
```

## 🟡Creating a Pop-up/Prompt

```lua
Library:Popup({
	Name = "Popup", -- String
	Text = "Do you want to accept?", -- String
	Options = { "Yes", "No" }, -- Table
	Callback = function(option)
		-- Function (Returns the option)
	end,
})
```

## 🟡Changing UI DragSpeed

```lua
Library:SetDragSpeed(7) -- Default 7, Ranging from 0 - 100
```

## 🟡Changing UI Sound Effects Volume

```lua
Library:SetVolume(50) -- Default 50, Ranging from 0 - 100
```

## 🟡Changing Controls Hover Sound

```lua
ibrary:SetHoverSound("") -- Sound ID
```

## 🟡Changing Controls Click Sound

```lua
Library:SetClickSound("") -- Sound ID
```

## 🟡Changing Pop-up Sound

```lua
Library:SetPopupSound("") -- Sound ID
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
	ToggledRelativeYOffset = 5 -- Number (Y Offset from bottom of your screen. Set it to nil if you want it to be centred)
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
	ActivationCallback = function()
		-- Function
	end,
	DeativationCallback = function()
		-- Function
	end,
})
```

## 🟢Creating a Section

```lua
local Section = Tab:Section({
	Name = "Section" -- String
})
```

## 🟣Creating a Label

```lua
local Label = Section:Label({
	Name = "Label", -- String
})
```

### Updating label name

```lua
Label:SetName("New Label Name") -- String
```

### Deleting the label

```lua
Label:Destroy()
```

## 🟣Creating a Button

```lua
local Button = Section:Button({
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

### Deleting the toggle

```lua
Toggle:Destroy()
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

### Deleting the slider

```lua
Slider:Destroy()
```

## 🟣Creating a Keybind

```lua
local Keybind = Section:Keybind({
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

### Deleting the keybind

```lua
Keybind:Destroy()
```

## 🟣Creating a Small Textbox

```lua
local SmallTextbox = Section:SmallTextbox({
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

### Deleting the small textbox

```lua
SmallTextbox:Destroy()
```

## 🟣Creating a Big Textbox

```lua
local BigTextbox = Section:BigTextbox({
	Name = "Big Textbox", -- String
	Default = "Default Text", -- String
	PlaceHolderText = "Textbox | Placeholder Text", -- String
	ResetOnFocus = true, -- Bool
	Callback = function(Text)
		-- Function
	end
})
```

### Updating big textbox name

```lua
BigTextbox:SetName("New Textbox name") -- String
```

### Updating big textbox text

```lua
BigTextbox:SetText("Another text") -- String
```

### Deleting the big textbox

```lua
BigTextbox:Destroy()
```

## 🟣Creating a Dropdown

```lua
local Dropdown = Section:Dropdown({
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

### Deleting the dropdown

```lua
Dropdown:Destroy()
```

## 🟣Creating a Colour Picker

```lua
local Colorpicker = Section:Colorpicker({
	Name = "Colorpicker", -- String
	DefaultColor = Color3.new(1, 1, 1), -- Color3
	Callback = function(Color)
		-- Function, Color3
	end
})
```

### Set the colour

```lua
Colorpicker:SetColor(Colorpicker:SetColor(Color3.new(0, 0, 0))) -- Color 3
```

### Deleting the colour picker

```lua
Colorpicker:Destroy()
```

## ⚪Use this to test

```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()

Window = Library:Create({
	Name = "Vision UI Lib v2",
	Footer = "By Loco_CTO, Sius and BruhOOFBoi",
	ToggleKey = Enum.KeyCode.RightShift,
	LoadedCallback = function()
		Window:TaskBarOnly(false)
	end,
	KeySystem = false,
	Key = "123456",
	MaxAttempts = 5,
	DiscordLink = nil,
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

local Label = Section1:Label({
	Name = "Lame\nTest",
})

Label:SetName("LMAOOOOOOOO\n\n\n\n\nXD")

local Label = Section1:Label({
	Name = "Holy jesus loco is so handsome because i said so and he have not got a girlfriend what a shamelss sucker but idk i wanna have fun but minecraft doesnt let me",
})

local Button = Section1:Button({
	Name = "Real Button",
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
	Name = "Real Toggle",
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
	Name = "Real Slider",
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

local Slider = Section2:Slider({
	Name = "Real Slider",
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
	Name = "Real Keybind",
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
	Name = "Real Small Textbox",
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
	Name = "Real Dropdown",
	Items = {1, 2, 3, 4, "XD"},
	Callback = function(item)
		Library:Notify({
			Name = "Dropdown",
			Text = item,
			Icon = "rbxassetid://11401835376",
			Duration = 3,
		})
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

local Colorpicker = Section2:Colorpicker({
	Name = "Real Colorpicker",
	DefaultColor = Color3.new(1, 1, 1),
	Callback = function(Color)
		Library:Notify({
			Name = "Small Textbox updated",
			Text = "Color: "..tostring(Color),
			Icon = "rbxassetid://11401835376",
			Duration = 3,
		})
	end
})

local Button = Section2:Button({
	Name = "Random Color",
	Callback = function()
		Colorpicker:SetColor(Color3.fromRGB(math.random(1,256),math.random(1,256),math.random(1,256)))
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
