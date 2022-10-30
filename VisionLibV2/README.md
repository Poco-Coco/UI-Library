![Vison Lib Title only](https://user-images.githubusercontent.com/112562956/198860495-6f486850-4919-4b28-9692-6b4125ae116c.png)

# Vision UI Lib v2
- Desigend by Sius and BruhOOFBoi
- Scripted by Loco_CTO

*Heavily inspired by [Rayfield UI Library](https://github.com/shlexware/Rayfield/blob/main/Documentation.md)*

## Preview
![image](https://user-images.githubusercontent.com/112562956/198860516-a5f74c21-d911-4bed-aabc-06e350faeae0.png)

**:warning: The UI Library is still under development, not all functions in the preview are included.**


## 	:red_circle:Loading the library
```lua
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()
```

## :yellow_circle:Creating a Window
```lua
local Window = Library:Create({
	Name = "Vision UI Lib v2", -- String
	Footer = "By Loco_CTO, Sius and BruhOOFBoi", -- String
	ToggleKey = Enum.KeyCode.Return -- Enum.KeyCode
})
```

## 🔵Creating a Tab
```lua
local Tab = Window:Tab({
	Name = "Main",
	Icon = "rbxassetid://11396131982",
	Color = Color3.new(1, 0, 0)
})
```

## :green_circle:Creating a Section
```lua
local Section = Tab:Section({
	Name = "Section"
})
```

## :purple_circle:Creating a Button
```lua
local Button = Section1:Button({
	Name = "Button",
	Callback = function()
		-- Function
	end
})
```

### Updating button name
```lua
Button:SetName("New Button Name")
```

## :purple_circle:Creating a Toggle
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

## :purple_circle:Creating a Slider
```lua
local Slider = Section:Slider({
	Name = "Slider",
	Max = 100,
	Min = 0,
	Default = 50,
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

##### Created by Core Vision, Discord: https://discord.gg/Bp7wFcZeUn
