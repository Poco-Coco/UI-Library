-- Services
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")
local LocalPlayer = Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse() 

-- Var
local Library = {
	DragSpeed = 0.07,
	MainFrameHover = false,
	Sliding = false,
	Loaded = false
}

local TabIndex = 0

ScreeenY = Mouse.ViewSizeY
ScreeenX = Mouse.ViewSizeX

-- Lib
function Library:Tween(object, options, callback)
	local options = Library:Place_Defaults({
		Length = 2,
		Style = Enum.EasingStyle.Quint,
		Direction = Enum.EasingDirection.Out
	}, options)

	callback = callback or function() return end

	local tweeninfo = TweenInfo.new(options.Length, options.Style, options.Direction)

	local Tween = TweenService:Create(object, tweeninfo, options.Goal) 
	Tween:Play()

	Tween.Completed:Connect(function()
		callback()
	end)

	return Tween
end

function Library:ResizeCanvas(Tab)
	local NumChild = 0
	local ChildOffset = 0

	for i, v in pairs(Tab:GetChildren()) do
		if v:IsA("Frame") then
			NumChild += 1
			ChildOffset = ChildOffset + v.Size.Y.Offset
		end
	end

	local NumChildOffset = NumChild * 5

	local CanvasSizeY = NumChildOffset + ChildOffset + 10

	Library:Tween(Tab, {
		Length = 0.5,
		Goal = {CanvasSize = UDim2.new(0, 0, 0, CanvasSizeY)}
	})
end

function Library:ResizeSection(Section)
	local SectionContainer = Section:WaitForChild("SectionContainer")
	
	local NumChild = 0
	local ChildOffset = 0

	for i, v in pairs(SectionContainer:GetChildren()) do
		if v:IsA("Frame") then
			NumChild += 1
			ChildOffset = ChildOffset + v.Size.Y.Offset
		end
	end

	local NumChildOffset = NumChild * 5

	local ContainerSize = NumChildOffset + ChildOffset + 10
	local SectionSize = ContainerSize + 26

	Library:Tween(SectionContainer, {
		Length = 0.5,
		Goal = {Size = UDim2.new(0, 458, 0, ContainerSize)}
	})
	
	Library:Tween(Section, {
		Length = 0.5,
		Goal = {Size = UDim2.new(0, 458, 0, SectionSize)}
	})
end

function Library:Place_Defaults(defaults, options)
	defaults = defaults or {}
	options = options or {}
	for option, value in next, options do
		defaults[option] = value
	end

	return defaults
end

local LibFrame = {}
do
	-- StarterGui.Vision Lib v2
	LibFrame["1"] = Instance.new("ScreenGui")
	LibFrame["1"]["Name"] = [[Vision Lib v2]]
	LibFrame["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	LibFrame["1"]["Parent"] = (RunService:IsStudio() and LocalPlayer.PlayerGui) or game:GetService("CoreGui")
	
	-- StarterGui.Vision Lib v2.NotifFrame
	LibFrame["81"] = Instance.new("Frame", LibFrame["1"])
	LibFrame["81"]["Active"] = true
	LibFrame["81"]["BorderSizePixel"] = 0
	LibFrame["81"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	LibFrame["81"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	LibFrame["81"]["BackgroundTransparency"] = 1
	LibFrame["81"]["Size"] = UDim2.new(0.15399999916553497, 0, 0.6330000162124634, 0)
	LibFrame["81"]["Position"] = UDim2.new(0.925000011920929, 0, 0.6800000071525574, 0)
	LibFrame["81"]["Name"] = [[NotifFrame]]
	
	-- StarterGui.Vision Lib v2.NotifFrame.UIListLayout
	LibFrame["82"] = Instance.new("UIListLayout", LibFrame["81"])
	LibFrame["82"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom
	LibFrame["82"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
	LibFrame["82"]["Padding"] = UDim.new(0, 5)
	LibFrame["82"]["SortOrder"] = Enum.SortOrder.LayoutOrder

	-- StarterGui.Vision Lib v2.NotifFrame.UIPadding
	LibFrame["83"] = Instance.new("UIPadding", LibFrame["81"])
	LibFrame["83"]["PaddingRight"] = UDim.new(0, 40)
	LibFrame["83"]["PaddingBottom"] = UDim.new(0, 40)
end

function Library:Create(options)
	options = Library:Place_Defaults({
		Name = "Vision UI Lib v2",
		Footer = "By Loco_CTO, Sius and BruhOOFBoi",
		ToggleKey = Enum.KeyCode.RightShift,
		LoadedCallback = function() return end,
		KeySystem = false,
		Key = "123456",
		MaxAttempts = 5,
		DiscordLink = nil,
		ToggledRelativeYOffset = nil
	}, options or {})
	
	local Gui = {
		CurrentTab = nil,
		CurrentTabIndex = 0,
		TweeningToggle = false,
		ToggleKey = options.ToggleKey,
		Hidden = false,
		MaxAttempts = options.MaxAttempts,
		DiscordLink = options.DiscordLink,
		Key = options.Key
	}
	
	local StartAnimation = {}
	
	task.spawn(function()
		repeat
			task.wait()
		until Library.Loaded
		options.LoadedCallback()
		
		if options.ToggledRelativeYOffset ~= nil then
			Library:Tween(Gui["2"], {
				Length = 0.3,
				Goal = {Position = UDim2.new(0.5, 0, 0, ScreeenY-options.ToggledRelativeYOffset-221) }
			})
		end
	end)
	
	do
		-- StarterGui.Vision Lib v2.GuiFrame
		Gui["2"] = Instance.new("Frame", LibFrame["1"])
		Gui["2"]["BorderSizePixel"] = 0
		Gui["2"]["AutoLocalize"] = false
		Gui["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
		Gui["2"]["BackgroundTransparency"] = 1
		Gui["2"]["Size"] = UDim2.new(0, 498, 0, 496)
		Gui["2"]["ClipsDescendants"] = true
		Gui["2"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
		Gui["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
		Gui["2"]["Name"] = [[GuiFrame]]
		Gui["2"]["Visible"] = false

		-- StarterGui.Vision Lib v2.GuiFrame.NavBar
		Gui["3"] = Instance.new("Frame", Gui["2"])
		Gui["3"]["ZIndex"] = 2
		Gui["3"]["BorderSizePixel"] = 0
		Gui["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["3"]["Size"] = UDim2.new(0, 498, 0, 40)
		Gui["3"]["Position"] = UDim2.new(0, 0, 0, 455)
		Gui["3"]["Name"] = [[NavBar]]

		-- StarterGui.Vision Lib v2.GuiFrame.NavBar.UICorner
		Gui["4"] = Instance.new("UICorner", Gui["3"])
		Gui["4"]["CornerRadius"] = UDim.new(0, 4)

		-- StarterGui.Vision Lib v2.GuiFrame.NavBar.Time
		Gui["5"] = Instance.new("TextLabel", Gui["3"])
		Gui["5"]["BorderSizePixel"] = 0
		Gui["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["5"]["TextSize"] = 14
		Gui["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["5"]["Size"] = UDim2.new(0, 89, 0, 40)
		Gui["5"]["Text"] = [[14:12]]
		Gui["5"]["Name"] = [[Time]]
		Gui["5"]["Font"] = Enum.Font.GothamBold
		Gui["5"]["BackgroundTransparency"] = 1

		-- StarterGui.Vision Lib v2.GuiFrame.NavBar.TabButtonContainer
		Gui["6"] = Instance.new("ScrollingFrame", Gui["3"])
		Gui["6"]["Active"] = true
		Gui["6"]["ScrollingDirection"] = Enum.ScrollingDirection.X
		Gui["6"]["BorderSizePixel"] = 0
		Gui["6"]["CanvasSize"] = UDim2.new(0, 439, 0, 0)
		Gui["6"]["MidImage"] = [[]]
		Gui["6"]["TopImage"] = [[]]
		Gui["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["6"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.Always
		Gui["6"]["BackgroundTransparency"] = 1
		Gui["6"]["Size"] = UDim2.new(0, 350, 0, 40)
		Gui["6"]["ScrollBarThickness"] = 2
		Gui["6"]["Position"] = UDim2.new(0, 86, 0, 0)
		Gui["6"]["Name"] = [[TabButtonContainer]]
		Gui["6"]["BottomImage"] = [[]]

		-- StarterGui.Vision Lib v2.GuiFrame.NavBar.TabButtonContainer.UIListLayout
		Gui["7"] = Instance.new("UIListLayout", Gui["6"])
		Gui["7"]["FillDirection"] = Enum.FillDirection.Horizontal
		Gui["7"]["Padding"] = UDim.new(0, 7)
		Gui["7"]["SortOrder"] = Enum.SortOrder.LayoutOrder

		-- StarterGui.Vision Lib v2.GuiFrame.NavBar.TabButtonContainer.UIPadding
		Gui["c"] = Instance.new("UIPadding", Gui["6"])
		Gui["c"]["PaddingTop"] = UDim.new(0, 6)
		Gui["c"]["PaddingLeft"] = UDim.new(0, 3)
		
		-- StarterGui.Vision Lib v2.GuiFrame.NavBar.LeftControl
		Gui["15"] = Instance.new("TextButton", Gui["3"])
		Gui["15"]["BorderSizePixel"] = 0
		Gui["15"]["AutoButtonColor"] = false
		Gui["15"]["TextSize"] = 14
		Gui["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["15"]["TextColor3"] = Color3.fromRGB(96, 96, 96)
		Gui["15"]["Size"] = UDim2.new(0, 18, 0, 40)
		Gui["15"]["Name"] = [[LeftControl]]
		Gui["15"]["Text"] = [[<]]
		Gui["15"]["Font"] = Enum.Font.GothamBold
		Gui["15"]["Position"] = UDim2.new(0, 458, 0, 0)
		Gui["15"]["BackgroundTransparency"] = 1

		-- StarterGui.Vision Lib v2.GuiFrame.NavBar.RightControl
		Gui["16"] = Instance.new("TextButton", Gui["3"])
		Gui["16"]["BorderSizePixel"] = 0
		Gui["16"]["AutoButtonColor"] = false
		Gui["16"]["TextSize"] = 14
		Gui["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["16"]["Size"] = UDim2.new(0, 18, 0, 40)
		Gui["16"]["Name"] = [[RightControl]]
		Gui["16"]["Text"] = [[>]]
		Gui["16"]["Font"] = Enum.Font.GothamBold
		Gui["16"]["Position"] = UDim2.new(0, 475, 0, 0)
		Gui["16"]["BackgroundTransparency"] = 1

		-- StarterGui.Vision Lib v2.GuiFrame.NavBar.UIGradient
		Gui["17"] = Instance.new("UIGradient", Gui["3"])
		Gui["17"]["Rotation"] = 90
		Gui["17"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(36, 36, 36)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(25, 25, 25))}

		-- StarterGui.Vision Lib v2.GuiFrame.MainFrame
		Gui["18"] = Instance.new("Frame", Gui["2"])
		Gui["18"]["BorderSizePixel"] = 0
		Gui["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["18"]["Size"] = UDim2.new(0, 498, 0, 452)
		Gui["18"]["Name"] = [[MainFrame]]
		Gui["18"]["ClipsDescendants"] = true

		-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.UICorner
		Gui["19"] = Instance.new("UICorner", Gui["18"])
		Gui["19"]["CornerRadius"] = UDim.new(0, 4)

		-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.UIGradient
		Gui["1a"] = Instance.new("UIGradient", Gui["18"])
		Gui["1a"]["Rotation"] = 90
		Gui["1a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(46, 46, 46)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(40, 40, 40))}

		-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Seperator
		Gui["1b"] = Instance.new("Frame", Gui["18"])
		Gui["1b"]["ZIndex"] = 2
		Gui["1b"]["BorderSizePixel"] = 0
		Gui["1b"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55)
		Gui["1b"]["Size"] = UDim2.new(0, 496, 0, 2)
		Gui["1b"]["BorderColor3"] = Color3.fromRGB(51, 51, 51)
		Gui["1b"]["Position"] = UDim2.new(0, 0, 0, 33)
		Gui["1b"]["Name"] = [[Seperator]]

		-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Title
		Gui["1c"] = Instance.new("TextLabel", Gui["18"])
		Gui["1c"]["BorderSizePixel"] = 0
		Gui["1c"]["TextXAlignment"] = Enum.TextXAlignment.Left
		Gui["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["1c"]["TextSize"] = 15
		Gui["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		Gui["1c"]["Size"] = UDim2.new(0, 212, 0, 27)
		Gui["1c"]["Text"] = [[Home Tab]]
		Gui["1c"]["Name"] = [[Title]]
		Gui["1c"]["Font"] = Enum.Font.GothamBold
		Gui["1c"]["BackgroundTransparency"] = 1
		Gui["1c"]["Position"] = UDim2.new(0, 14, 0, 5)
	end
	
	do
		
		-- StarterGui.Vision Lib v2.StartAnimationFrame
		StartAnimation["91"] = Instance.new("Frame", LibFrame["1"])
		StartAnimation["91"]["BorderSizePixel"] = 0
		StartAnimation["91"]["AutoLocalize"] = false
		StartAnimation["91"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["91"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
		StartAnimation["91"]["BackgroundTransparency"] = 1
		StartAnimation["91"]["Size"] = UDim2.new(0, 498, 0, 498)
		StartAnimation["91"]["ClipsDescendants"] = true
		StartAnimation["91"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
		StartAnimation["91"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
		StartAnimation["91"]["Name"] = [[StartAnimationFrame]]

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main
		StartAnimation["92"] = Instance.new("Frame", StartAnimation["91"])
		StartAnimation["92"]["ZIndex"] = 2
		StartAnimation["92"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["92"]["Size"] = UDim2.new(0, 310, 0, 0)
		StartAnimation["92"]["Position"] = UDim2.new(0.186, 0, 0.167, 0)
		StartAnimation["92"]["Name"] = [[Main]]
		StartAnimation["92"]["ClipsDescendants"] = true
		StartAnimation["92"]["BorderSizePixel"] = 0

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.UIGradient
		StartAnimation["93"] = Instance.new("UIGradient", StartAnimation["92"])
		StartAnimation["93"]["Rotation"] = 90
		StartAnimation["93"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(46, 46, 46)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(40, 40, 40))}

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.UICorner
		StartAnimation["94"] = Instance.new("UICorner", StartAnimation["92"])
		StartAnimation["94"]["CornerRadius"] = UDim.new(0, 4)

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.Title
		StartAnimation["95"] = Instance.new("TextLabel", StartAnimation["92"])
		StartAnimation["95"]["ZIndex"] = 2
		StartAnimation["95"]["BorderSizePixel"] = 0
		StartAnimation["95"]["TextXAlignment"] = Enum.TextXAlignment.Left
		StartAnimation["95"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["95"]["TextSize"] = 20
		StartAnimation["95"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["95"]["Size"] = UDim2.new(0, 255, 0, 32)
		StartAnimation["95"]["Text"] = options.Name
		StartAnimation["95"]["Name"] = [[Title]]
		StartAnimation["95"]["Font"] = Enum.Font.GothamMedium
		StartAnimation["95"]["BackgroundTransparency"] = 1
		StartAnimation["95"]["Position"] = UDim2.new(0, 10, 0, 5)

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.Title
		StartAnimation["96"] = Instance.new("TextLabel", StartAnimation["92"])
		StartAnimation["96"]["ZIndex"] = 2
		StartAnimation["96"]["BorderSizePixel"] = 0
		StartAnimation["96"]["TextXAlignment"] = Enum.TextXAlignment.Left
		StartAnimation["96"]["TextYAlignment"] = Enum.TextYAlignment.Top
		StartAnimation["96"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["96"]["TextSize"] = 11
		StartAnimation["96"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["96"]["Size"] = UDim2.new(0, 255, 0, 18)
		StartAnimation["96"]["Text"] = options.Footer
		StartAnimation["96"]["Name"] = [[Title]]
		StartAnimation["96"]["Font"] = Enum.Font.Gotham
		StartAnimation["96"]["BackgroundTransparency"] = 1
		StartAnimation["96"]["Position"] = UDim2.new(0, 12, 0, 32)

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.LoadBack
		StartAnimation["97"] = Instance.new("Frame", StartAnimation["92"])
		StartAnimation["97"]["ZIndex"] = 2
		StartAnimation["97"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["97"]["Size"] = UDim2.new(0, 285, 0, 6)
		StartAnimation["97"]["Position"] = UDim2.new(0.03870967775583267, 0, 0.942219614982605, 0)
		StartAnimation["97"]["Name"] = [[LoadBack]]

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.LoadBack.UICorner
		StartAnimation["98"] = Instance.new("UICorner", StartAnimation["97"])
		StartAnimation["98"]["CornerRadius"] = UDim.new(0, 7)

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.LoadBack.LoadFront
		StartAnimation["99"] = Instance.new("Frame", StartAnimation["97"])
		StartAnimation["99"]["ZIndex"] = 2
		StartAnimation["99"]["BackgroundColor3"] = Color3.fromRGB(191, 191, 191)
		StartAnimation["99"]["Size"] = UDim2.new(0.035087719559669495, 0, 1, 0)
		StartAnimation["99"]["Position"] = UDim2.new(-0.007017544005066156, 0, 0, 0)
		StartAnimation["99"]["Name"] = [[LoadFront]]

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.LoadBack.LoadFront.UICorner
		StartAnimation["9a"] = Instance.new("UICorner", StartAnimation["99"])
		StartAnimation["9a"]["CornerRadius"] = UDim.new(0, 7)

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.LoadBack.LoadFront.UIGradient
		StartAnimation["9b"] = Instance.new("UIGradient", StartAnimation["99"])
		StartAnimation["9b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(75, 75, 75)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(99, 99, 99))}

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.CharAva
		StartAnimation["9c"] = Instance.new("ImageLabel", StartAnimation["92"])
		StartAnimation["9c"]["ZIndex"] = 2
		StartAnimation["9c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["9c"]["Image"] = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
		StartAnimation["9c"]["Size"] = UDim2.new(0, 70, 0, 70)
		StartAnimation["9c"]["Name"] = [[CharAva]]
		StartAnimation["9c"]["Position"] = UDim2.new(0, 12, 0, 49)
		StartAnimation["9c"]["BackgroundTransparency"] = 1
		StartAnimation["9c"]["ImageTransparency"] = 1

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.CharAva.UICorner
		StartAnimation["9d"] = Instance.new("UICorner", StartAnimation["9c"])
		StartAnimation["9d"]["CornerRadius"] = UDim.new(1, 8)

		-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.WelcomeText
		StartAnimation["9e"] = Instance.new("TextLabel", StartAnimation["92"])
		StartAnimation["9e"]["TextWrapped"] = true
		StartAnimation["9e"]["ZIndex"] = 2
		StartAnimation["9e"]["TextXAlignment"] = Enum.TextXAlignment.Left
		StartAnimation["9e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["9e"]["TextSize"] = 19
		StartAnimation["9e"]["TextTransparency"] = 1
		StartAnimation["9e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		StartAnimation["9e"]["Size"] = UDim2.new(0, 282, 0, 70)
		StartAnimation["9e"]["Text"] = [[Welcome, ]]..Players.LocalPlayer.Name
		StartAnimation["9e"]["Name"] = [[WelcomeText]]
		StartAnimation["9e"]["Font"] = Enum.Font.GothamMedium
		StartAnimation["9e"]["BackgroundTransparency"] = 1
		StartAnimation["9e"]["Position"] = UDim2.new(0, 98, 0, 49)
	end
	
	-- Start animation
	do
		task.spawn(function()
			Library.Sliding = true
			
			Library:Tween(StartAnimation["92"], {
				Length = 1,
				Goal = {Size = UDim2.new(0, 310, 0, 230)}
			})
			
			task.wait(1)
			
			
			Library:Tween(StartAnimation["99"], {
				Length = 2.7,
				Direction = Enum.EasingDirection.In,
				Goal = {Size = UDim2.new(1, 0, 1, 0)}
			})
			task.wait(2.7)
			
			Library:Tween(StartAnimation["97"], {
				Length = 0.5,
				Goal = {BackgroundTransparency = 1}
			})
			
			Library:Tween(StartAnimation["99"], {
				Length = 0.5,
				Goal = {BackgroundTransparency = 1}
			})
			
			local KeyChecked = false
			
			if options.KeySystem then
				local KeySystem = {
					CorrectKey = false,
					KeyTextboxHover = false,
					Attempts = Gui.MaxAttempts
				}
				
				do
					-- StarterGui.Vision Lib v2.StartAnimationFrame.Main.Key
					KeySystem["a0"] = Instance.new("Frame", StartAnimation["92"])
					KeySystem["a0"]["ZIndex"] = 3
					KeySystem["a0"]["BackgroundColor3"] = Color3.fromRGB(149, 149, 149)
					KeySystem["a0"]["Size"] = UDim2.new(0, 253, 0, 20)
					KeySystem["a0"]["Position"] = UDim2.new(0, 28, 0, 33)
					KeySystem["a0"]["Name"] = [[Key]]

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.Key.UICorner
					KeySystem["a1"] = Instance.new("UICorner", KeySystem["a0"])
					KeySystem["a1"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.Key.UIStroke
					KeySystem["a2"] = Instance.new("UIStroke", KeySystem["a0"])
					KeySystem["a2"]["Color"] = Color3.fromRGB(43, 43, 43)

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.Key.UIGradient
					KeySystem["a3"] = Instance.new("UIGradient", KeySystem["a0"])
					KeySystem["a3"]["Rotation"] = 270
					KeySystem["a3"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(86, 86, 86)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(89, 89, 89))}

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.Key.TextBox
					KeySystem["a4"] = Instance.new("TextBox", KeySystem["a0"])
					KeySystem["a4"]["CursorPosition"] = -1
					KeySystem["a4"]["PlaceholderColor3"] = Color3.fromRGB(127, 127, 127)
					KeySystem["a4"]["ZIndex"] = 3
					KeySystem["a4"]["RichText"] = true
					KeySystem["a4"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					KeySystem["a4"]["TextXAlignment"] = Enum.TextXAlignment.Left
					KeySystem["a4"]["TextSize"] = 11
					KeySystem["a4"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51)
					KeySystem["a4"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
					KeySystem["a4"]["PlaceholderText"] = [[Key | e.g abc123]]
					KeySystem["a4"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.8999999761581421, 0)
					KeySystem["a4"]["Text"] = [[]]
					KeySystem["a4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
					KeySystem["a4"]["Font"] = Enum.Font.Gotham

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.Key.TextBox.UICorner
					KeySystem["a5"] = Instance.new("UICorner", KeySystem["a4"])
					KeySystem["a5"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.KeySystemTitle
					KeySystem["a6"] = Instance.new("TextLabel", StartAnimation["92"])
					KeySystem["a6"]["ZIndex"] = 2
					KeySystem["a6"]["BorderSizePixel"] = 0
					KeySystem["a6"]["TextXAlignment"] = Enum.TextXAlignment.Left
					KeySystem["a6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					KeySystem["a6"]["TextSize"] = 11
					KeySystem["a6"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					KeySystem["a6"]["Size"] = UDim2.new(0, 158, 0, 16)
					KeySystem["a6"]["Text"] = [[Key System]]
					KeySystem["a6"]["Name"] = [[KeySystemTitle]]
					KeySystem["a6"]["Font"] = Enum.Font.GothamMedium
					KeySystem["a6"]["BackgroundTransparency"] = 1
					KeySystem["a6"]["Position"] = UDim2.new(0, 34, 0, 14)

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.KeySystemNote
					KeySystem["a8"] = Instance.new("Frame", StartAnimation["92"])
					KeySystem["a8"]["ZIndex"] = 3
					KeySystem["a8"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
					KeySystem["a8"]["Size"] = UDim2.new(0, 215, 0, 50)
					KeySystem["a8"]["Position"] = UDim2.new(0, 49, 0, 61)
					KeySystem["a8"]["Name"] = [[KeySystemNote]]

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.KeySystemNote.TextLabel
					KeySystem["a9"] = Instance.new("TextLabel", KeySystem["a8"])
					KeySystem["a9"]["TextWrapped"] = true
					KeySystem["a9"]["ZIndex"] = 2
					KeySystem["a9"]["TextXAlignment"] = Enum.TextXAlignment.Left
					KeySystem["a9"]["TextYAlignment"] = Enum.TextYAlignment.Top
					KeySystem["a9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					KeySystem["a9"]["TextSize"] = 9
					KeySystem["a9"]["TextColor3"] = Color3.fromRGB(205, 205, 205)
					KeySystem["a9"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
					KeySystem["a9"]["Size"] = UDim2.new(0.949999988079071, 0, 0.800000011920929, 0)
					KeySystem["a9"]["Text"] = [[Note: Join our discord to get the key!]]
					KeySystem["a9"]["Font"] = Enum.Font.Gotham
					KeySystem["a9"]["BackgroundTransparency"] = 1
					KeySystem["a9"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
					
					KeySystem["a0"]["BackgroundTransparency"] = 1
					KeySystem["a4"]["BackgroundTransparency"] = 1
					KeySystem["a8"]["BackgroundTransparency"] = 1
					KeySystem["a4"]["TextTransparency"] = 1
					KeySystem["a9"]["TextTransparency"] = 1
					KeySystem["a6"]["TextTransparency"] = 1

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.KeySystemNote.UICorner
					KeySystem["aa"] = Instance.new("UICorner", KeySystem["a8"])
					
					-- Methods
					do
						KeySystem["a0"].MouseEnter:Connect(function()
							Library:Tween(KeySystem["a2"], {
								Length = 0.2,
								Goal = {Color = Color3.fromRGB(93, 93, 93)}
							})
							
							KeySystem.KeyTextboxHover = true
						end)
						
						KeySystem["a0"].MouseLeave:Connect(function()
							Library:Tween(KeySystem["a2"], {
								Length = 0.2,
								Goal = {Color = Color3.fromRGB(43, 43, 43)}
							})
							
							KeySystem.KeyTextboxHover = false
						end)
						
						KeySystem["a4"].FocusLost:Connect(function()
							local keyEntered = KeySystem["a4"]["Text"]
							
							if keyEntered ~= "" then

								if keyEntered == Gui.Key then
									KeySystem.CorrectKey = true

									Library:ForceNotify({
										Name = "KeySystem",
										Text = "Correct key!",
										Icon = "rbxassetid://11401835376",
										Duration = 3
									})
								else
									KeySystem.Attempts -= 1

									Library:ForceNotify({
										Name = "KeySystem",
										Text = "Incorrect key! You still have "..tostring(KeySystem.Attempts).." attempts left!",
										Icon = "rbxassetid://11401835376",
										Duration = 3
									})
								end

								KeySystem["a4"]["Text"] = ""

								if KeySystem.Attempts == 0 then
									game.Players.LocalPlayer:Kick("Too many failed attempts")
								end

								if KeySystem.KeyTextboxHover then
									Library:Tween(KeySystem["a2"], {
										Length = 0.2,
										Goal = {Color = Color3.fromRGB(93, 93, 93)}
									})
								else
									Library:Tween(KeySystem["a2"], {
										Length = 0.2,
										Goal = {Color = Color3.fromRGB(43, 43, 43)}
									})
								end
							end
						end)
					end
				end
				
				
				do
					-- Others tween
					do
						Library:Tween(StartAnimation["92"], {
							Length = 1,
							Goal = {Position = UDim2.new(0, 92, 0, 159)}
						})

						Library:Tween(StartAnimation["92"], {
							Length = 1,
							Goal = {Size = UDim2.new(0, 310, 0, 154)}
						})
						

						Library:Tween(StartAnimation["96"], {
							Length = 0.7,
							Goal = {TextTransparency = 1}
						})

						Library:Tween(StartAnimation["95"], {
							Length = 0.7,
							Goal = {TextTransparency = 1}
						})
					end
					
					task.wait(1)
					
					-- Ui tween
					do
						Library:Tween(KeySystem["a4"], {
							Length = 0.7,
							Goal = {TextTransparency = 0}
						})
						
						Library:Tween(KeySystem["a9"], {
							Length = 0.7,
							Goal = {TextTransparency = 0}
						})
						
						Library:Tween(KeySystem["a6"], {
							Length = 0.7,
							Goal = {TextTransparency = 0}
						})
						
						Library:Tween(KeySystem["a8"], {
							Length = 0.7,
							Goal = {BackgroundTransparency = 0}
						})
						
						Library:Tween(KeySystem["a4"], {
							Length = 0.7,
							Goal = {BackgroundTransparency = 0}
						})
						
						Library:Tween(KeySystem["a0"], {
							Length = 0.7,
							Goal = {BackgroundTransparency = 0}
						})
					end
				end
				
				if Gui.DiscordLink ~= nil then
					
					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.DiscordServerButton
					KeySystem["ab"] = Instance.new("TextButton", StartAnimation["92"])
					KeySystem["ab"]["TextStrokeTransparency"] = 0
					KeySystem["ab"]["ZIndex"] = 3
					KeySystem["ab"]["AutoButtonColor"] = false
					KeySystem["ab"]["TextSize"] = 12
					KeySystem["ab"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					KeySystem["ab"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					KeySystem["ab"]["Size"] = UDim2.new(0, 100, 0, 19)
					KeySystem["ab"]["Name"] = [[DiscordServerButton]]
					KeySystem["ab"]["Text"] = [[Copy discord invite]]
					KeySystem["ab"]["Font"] = Enum.Font.Gotham
					KeySystem["ab"]["Position"] = UDim2.new(0, 104, 0, 118)
					KeySystem["ab"]["MaxVisibleGraphemes"] = 0

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.DiscordServerButton.TextLabel
					KeySystem["ac"] = Instance.new("TextLabel", KeySystem["ab"])
					KeySystem["ac"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					KeySystem["ac"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255)
					KeySystem["ac"]["TextSize"] = 9
					KeySystem["ac"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					KeySystem["ac"]["Size"] = UDim2.new(1, 0, 1, 0)
					KeySystem["ac"]["Text"] = [[Copy discord invite]]
					KeySystem["ac"]["Font"] = Enum.Font.GothamMedium
					KeySystem["ac"]["BackgroundTransparency"] = 1

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.DiscordServerButton.UIStroke
					KeySystem["ad"] = Instance.new("UIStroke", KeySystem["ab"])
					KeySystem["ad"]["Color"] = Color3.fromRGB(89, 102, 243)
					KeySystem["ad"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.DiscordServerButton.UIGradient
					KeySystem["ae"] = Instance.new("UIGradient", KeySystem["ab"])
					KeySystem["ae"]["Rotation"] = 90
					KeySystem["ae"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(89, 102, 243)),ColorSequenceKeypoint.new(0.516, Color3.fromRGB(78, 90, 213)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(63, 74, 172))}

					-- StarterGui.Vision Lib v2.KeySystemFrame.Main.DiscordServerButton.UICorner
					KeySystem["af"] = Instance.new("UICorner", KeySystem["ab"])
					KeySystem["af"]["CornerRadius"] = UDim.new(0, 4)
					
					KeySystem["ab"]["BackgroundTransparency"] = 1
					KeySystem["ac"]["TextTransparency"] = 1
					KeySystem["ad"]["Transparency"] = 1
					
					do
						Library:Tween(KeySystem["ad"], {
							Length = 0.7,
							Goal = {Transparency = 0}
						})
						
						Library:Tween(KeySystem["ab"], {
							Length = 0.7,
							Goal = {BackgroundTransparency = 0}
						})
						
						Library:Tween(KeySystem["ac"], {
							Length = 0.7,
							Goal = {TextTransparency = 0}
						})
					end
					
					-- Handler
					do
						KeySystem["ab"].MouseEnter:Connect(function()
							Library:Tween(KeySystem["ad"], {
								Length = 0.2,
								Goal = {Color = Color3.fromRGB(137, 145, 213)}
							})
						end)
						
						KeySystem["ab"].MouseLeave:Connect(function()
							Library:Tween(KeySystem["ad"], {
								Length = 0.2,
								Goal = {Color = Color3.fromRGB(89, 102, 243)}
							})
						end)
						
						KeySystem["ab"].MouseButton1Click:Connect(function()
							
							task.spawn(function()
								Library:ForceNotify({
									Name = "Discord",
									Text = "Copied the discord link to clipboard!",
									Icon = "rbxassetid://11401835376",
									Duration = 3
								})
								
								Library:Tween(KeySystem["ad"], {
									Length = 0.2,
									Goal = {Color = Color3.fromRGB(183, 188, 213)}
								})
								
								task.wait(0.2)

								Library:Tween(KeySystem["ad"], {
									Length = 0.2,
									Goal = {Color = Color3.fromRGB(137, 145, 213)}
								})
							end)
							
							pcall(function()
								setclipboard(Gui.DiscordLink)
							end)
						end)
					end
				end
				
				repeat
					task.wait()
				until KeySystem.CorrectKey
				
				do
					do
						Library:Tween(KeySystem["a4"], {
							Length = 0.7,
							Goal = {TextTransparency = 1}
						})

						Library:Tween(KeySystem["a9"], {
							Length = 0.7,
							Goal = {TextTransparency = 1}
						})

						Library:Tween(KeySystem["a6"], {
							Length = 0.7,
							Goal = {TextTransparency = 1}
						})

						Library:Tween(KeySystem["a8"], {
							Length = 0.7,
							Goal = {BackgroundTransparency = 1}
						})

						Library:Tween(KeySystem["a4"], {
							Length = 0.7,
							Goal = {BackgroundTransparency = 1}
						})

						Library:Tween(KeySystem["a0"], {
							Length = 0.7,
							Goal = {BackgroundTransparency = 1}
						})
						
						Library:Tween(KeySystem["a2"], {
							Length = 0.7,
							Goal = {Transparency = 1}
						})
					end
					
					if Gui.DiscordLink ~= nil then
						do
							Library:Tween(KeySystem["ad"], {
								Length = 0.7,
								Goal = {Transparency = 1}
							})

							Library:Tween(KeySystem["ab"], {
								Length = 0.7,
								Goal = {BackgroundTransparency = 1}
							})

							Library:Tween(KeySystem["ac"], {
								Length = 0.7,
								Goal = {TextTransparency = 1}
							})
						end
					end
				end
				
				task.wait(1)
				
				Library:Tween(StartAnimation["96"], {
					Length = 0.7,
					Goal = {TextTransparency = 0}
				})

				Library:Tween(StartAnimation["95"], {
					Length = 0.7,
					Goal = {TextTransparency = 0}
				})
				
				KeyChecked = true
			else
				KeyChecked = true
			end
			
			repeat
				task.wait()
			until KeyChecked
			
			task.wait(0.3)
			
			Library:Tween(StartAnimation["92"], {
				Length = 1,
				Goal = {Position = UDim2.new(0, 0, 0, 0)}
			})

			Library:Tween(StartAnimation["92"], {
				Length = 1,
				Goal = {Size = UDim2.new(0, 498, 0, 452)}
			})

			Library:Tween(StartAnimation["9e"], {
				Length = 0.7,
				Goal = {TextTransparency = 0}
			})

			Library:Tween(StartAnimation["9c"] , {
				Length = 0.7,
				Goal = {ImageTransparency = 0}
			})

			Library:Tween(StartAnimation["9c"], {
				Length = 0.7,
				Goal = {BackgroundTransparency = 0}
			})
			
			task.wait(1)
			
			Gui["2"]["Size"] = UDim2.new(0, 498, 0, 0)
			Gui["2"]["Visible"] = true
						
			task.wait(1.8)
			
			Library:Tween(StartAnimation["96"], {
				Length = 0.7,
				Goal = {TextTransparency = 1}
			})

			Library:Tween(StartAnimation["95"], {
				Length = 0.7,
				Goal = {TextTransparency = 1}
			})
			
			Library:Tween(StartAnimation["9e"], {
				Length = 0.7,
				Goal = {TextTransparency = 1}
			})

			Library:Tween(StartAnimation["9c"], {
				Length = 0.7,
				Goal = {ImageTransparency = 1}
			})

			Library:Tween(StartAnimation["9c"], {
				Length = 0.7,
				Goal = {BackgroundTransparency = 1}
			})
			
			task.wait(0.1)
			
			Gui["3"]["Position"] = UDim2.new(0, 0, 0, 300)
			Gui["2"]["Size"] = UDim2.new(0, 498, 0, 498)
			
			Library:Tween(Gui["3"], {
				Length = 1.5,
				Goal = {Position = UDim2.new(0, 0, 0, 455)}
			})
			
			task.wait(2)
			
			Library:Tween(StartAnimation["92"], {
				Length = 0.5,
				Goal = {BackgroundTransparency = 1}
			})
			
			Library.Sliding = false
			Library.Loaded = true
		end)
	end
	
	function Gui:Tab(options)
		options = Library:Place_Defaults({
			Name = "Tab",
			Icon = "rbxassetid://11396131982",
			Color = Color3.new(1, 0.290196, 0.290196)
		}, options or {})
		
		local Tab = {
			Active = false,
			Hover = false,
			Index = TabIndex
		}
		
		TabIndex += 1
		
		do
			-- StarterGui.Vision Lib v2.GuiFrame.NavBar.TabButtonContainer.TabButton
			Tab["8"] = Instance.new("Frame", Gui["6"])
			Tab["8"]["BorderSizePixel"] = 0
			Tab["8"]["BackgroundColor3"] = Color3.fromRGB(74, 74, 74)
			Tab["8"]["Size"] = UDim2.new(0, 28, 0, 28)
			Tab["8"]["Name"] = [[TabButton]]

			-- StarterGui.Vision Lib v2.GuiFrame.NavBar.TabButtonContainer.TabButton.UICorner
			Tab["9"] = Instance.new("UICorner", Tab["8"])
			Tab["9"]["CornerRadius"] = UDim.new(0, 5)

			-- StarterGui.Vision Lib v2.GuiFrame.NavBar.TabButtonContainer.TabButton.ImageLabel
			Tab["b"] = Instance.new("ImageLabel", Tab["8"])
			Tab["b"]["ZIndex"] = 2
			Tab["b"]["BorderSizePixel"] = 0
			Tab["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Tab["b"]["ImageColor3"] = Color3.fromRGB(245, 245, 245)
			Tab["b"]["Image"] = options.Icon
			Tab["b"]["Size"] = UDim2.new(0, 22, 0, 22)
			Tab["b"]["BackgroundTransparency"] = 1
			Tab["b"]["Position"] = UDim2.new(0.1071428582072258, 0, 0.1071428582072258, 0)
		end
		
		-- Container
		do
			-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container
			Tab["1d"] = Instance.new("ScrollingFrame", Gui["18"])
			Tab["1d"]["Active"] = true
			Tab["1d"]["ScrollingDirection"] = Enum.ScrollingDirection.Y
			Tab["1d"]["BorderSizePixel"] = 0
			Tab["1d"]["CanvasSize"] = UDim2.new(0, 0, 0, 0)
			Tab["1d"]["CanvasPosition"] = Vector2.new(0, 150)
			Tab["1d"]["ScrollBarImageTransparency"] = 1
			Tab["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
			Tab["1d"]["BackgroundTransparency"] = 1
			Tab["1d"]["Size"] = UDim2.new(0, 498, 0, 417)
			Tab["1d"]["ScrollBarImageColor3"] = Color3.fromRGB(20, 20, 20)
			Tab["1d"]["ScrollBarThickness"] = 5
			Tab["1d"]["Position"] = UDim2.new(0, 0, 0, 35)
			Tab["1d"]["Name"] = [[Container]]
			Tab["1d"]["Visible"] = false
			
			-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.UIPadding
			Tab["7c"] = Instance.new("UIPadding", Tab["1d"])
			Tab["7c"]["PaddingTop"] = UDim.new(0, 5)
			Tab["7c"]["PaddingLeft"] = UDim.new(0, 20)

			-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.UIListLayout
			Tab["7d"] = Instance.new("UIListLayout", Tab["1d"])
			Tab["7d"]["Padding"] = UDim.new(0, 5)
			Tab["7d"]["SortOrder"] = Enum.SortOrder.LayoutOrder
		end
		
		function Tab:Section(options)
			options = Library:Place_Defaults({
				Name = "Section"
			}, options or {})
			
			local Section = {}
			
			-- Section and Container
			do
				-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame
				Section["1e"] = Instance.new("Frame", Tab["1d"])
				Section["1e"]["BorderSizePixel"] = 0
				Section["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Section["1e"]["Size"] = UDim2.new(0, 458, 0, 385)
				Section["1e"]["Position"] = UDim2.new(0, 0, 0, -150)
				Section["1e"]["Name"] = [[SectionFrame]]

				-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.UIGradient
				Section["1f"] = Instance.new("UIGradient", Section["1e"])
				Section["1f"]["Rotation"] = 90
				Section["1f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(32, 32, 32)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(25, 25, 25))}

				-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionLabel
				Section["20"] = Instance.new("TextLabel", Section["1e"])
				Section["20"]["BorderSizePixel"] = 0
				Section["20"]["TextXAlignment"] = Enum.TextXAlignment.Left
				Section["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Section["20"]["TextSize"] = 12
				Section["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
				Section["20"]["Size"] = UDim2.new(0, 408, 0, 18)
				Section["20"]["Text"] = options.Name
				Section["20"]["Name"] = [[SectionLabel]]
				Section["20"]["Font"] = Enum.Font.GothamMedium
				Section["20"]["BackgroundTransparency"] = 1
				Section["20"]["Position"] = UDim2.new(0, 8, 0, 6)
				
				-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer
				Section["21"] = Instance.new("Frame", Section["1e"])
				Section["21"]["BorderSizePixel"] = 0
				Section["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
				Section["21"]["BackgroundTransparency"] = 1
				Section["21"]["Size"] = UDim2.new(0, 458, 0, 425)
				Section["21"]["Position"] = UDim2.new(0, 0, 0, 26)
				Section["21"]["Name"] = [[SectionContainer]]

				-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.UIListLayout
				Section["22"] = Instance.new("UIListLayout", Section["21"])
				Section["22"]["Padding"] = UDim.new(0, 5)
				Section["22"]["SortOrder"] = Enum.SortOrder.LayoutOrder

				-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.UIPadding
				Section["23"] = Instance.new("UIPadding", Section["21"])
				Section["23"]["PaddingLeft"] = UDim.new(0, 17)
				
				-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.UICorner
				Section["7a"] = Instance.new("UICorner", Section["1e"])
				Section["7a"]["CornerRadius"] = UDim.new(0, 4)

				-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.UIStroke
				Section["7b"] = Instance.new("UIStroke", Section["1e"])
				Section["7b"]["Color"] = Color3.fromRGB(43, 43, 43)
			end
			
			function Section:Button(options)
				options = Library:Place_Defaults({
					Name = "Button",
					Callback = function() return end
				}, options or {})
				
				local Button = {
					Hover = false
				}
				
				do
					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Button
					Button["74"] = Instance.new("Frame", Section["21"])
					Button["74"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Button["74"]["Size"] = UDim2.new(0, 423, 0, 34)
					Button["74"]["Position"] = UDim2.new(0, 17, 0, 22)
					Button["74"]["Name"] = [[Button]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Button.UICorner
					Button["75"] = Instance.new("UICorner", Button["74"])
					Button["75"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Button.UIGradient
					Button["76"] = Instance.new("UIGradient", Button["74"])
					Button["76"]["Rotation"] = 270
					Button["76"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 40, 40)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(45, 45, 45))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Button.Label
					Button["77"] = Instance.new("TextLabel", Button["74"])
					Button["77"]["BorderSizePixel"] = 0
					Button["77"]["TextXAlignment"] = Enum.TextXAlignment.Left
					Button["77"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Button["77"]["TextSize"] = 13
					Button["77"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Button["77"]["Size"] = UDim2.new(0, 301, 0, 33)
					Button["77"]["Text"] = options.Name
					Button["77"]["Name"] = [[Label]]
					Button["77"]["Font"] = Enum.Font.GothamMedium
					Button["77"]["BackgroundTransparency"] = 1
					Button["77"]["Position"] = UDim2.new(0, 21, 0, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Button.UIStroke
					Button["78"] = Instance.new("UIStroke", Button["74"])
					Button["78"]["Color"] = Color3.fromRGB(43, 43, 43)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Button.ImageLabel
					Button["79"] = Instance.new("ImageLabel", Button["74"])
					Button["79"]["BorderSizePixel"] = 0
					Button["79"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Button["79"]["Image"] = [[rbxassetid://11400928498]]
					Button["79"]["Size"] = UDim2.new(0, 21, 0, 21)
					Button["79"]["BackgroundTransparency"] = 1
					Button["79"]["Position"] = UDim2.new(0.9219858050346375, 0, 0.1764705926179886, 0)
				end
				
				-- Handler
				do
					Button["74"].MouseEnter:Connect(function()
						Library:Tween(Button["78"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(65, 65, 65)}
						})
						
						Button.Hover = true
					end)
					
					Button["74"].MouseLeave:Connect(function()
						Library:Tween(Button["78"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(43, 43, 43)}
						})
						
						Button.Hover = false
					end)
					
					UserInputService.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
							Library:Tween(Button["78"], {
								Length = 0.2,
								Goal = {Color = Color3.fromRGB(86, 86, 86)}
							})
							
							Library:Tween(Button["79"], {
								Length = 0.2,
								Goal = {ImageColor3 = Color3.fromRGB(105, 53, 189)}
							})
							
							-- Callback
							do
								task.spawn(function()
									options.Callback()
								end)
							end
							
							task.wait(0.2)
							Library:Tween(Button["79"], {
								Length = 0.2,
								Goal = {ImageColor3 = Color3.fromRGB(255, 255, 255)}
							})
							
							if Button.Hover then
								Library:Tween(Button["78"], {
									Length = 0.2,
									Goal = {Color = Color3.fromRGB(65, 65, 65)}
								})
							else
								Library:Tween(Button["78"], {
									Length = 0.2,
									Goal = {Color = Color3.fromRGB(43, 43, 43)}
								})
							end
						end
					end)
				end
				
				-- Methods
				do
					function Button:SetName(name)
						Button["77"]["Text"] = name
					end
				end
				
				task.spawn(function()
					Library:ResizeSection(Section["1e"])
					task.wait(1)
					Library:ResizeCanvas(Tab["1d"])
				end)
				
				return Button
			end
			
			function Section:Toggle(options)
				options = Library:Place_Defaults({
					Name = "Toggle",
					Default = false,
					Callback = function() return end
				}, options or {})

				local Toggle = {
					Hover = false,
					Bool = options.Default
				}

				do
					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle
					Toggle["24"] = Instance.new("Frame", Section["21"])
					Toggle["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Toggle["24"]["Size"] = UDim2.new(0, 423, 0, 34)
					Toggle["24"]["Position"] = UDim2.new(0, 17, 0, 22)
					Toggle["24"]["Name"] = [[Toggle]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle.UICorner
					Toggle["25"] = Instance.new("UICorner", Toggle["24"])
					Toggle["25"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle.UIGradient
					Toggle["26"] = Instance.new("UIGradient", Toggle["24"])
					Toggle["26"]["Rotation"] = 270
					Toggle["26"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 40, 40)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(45, 45, 45))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle.Toggle
					Toggle["27"] = Instance.new("TextButton", Toggle["24"])
					Toggle["27"]["BorderSizePixel"] = 0
					Toggle["27"]["AutoButtonColor"] = false
					Toggle["27"]["TextSize"] = 14
					Toggle["27"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Toggle["27"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
					Toggle["27"]["Size"] = UDim2.new(0, 38, 0, 18)
					Toggle["27"]["Name"] = [[Toggle]]
					Toggle["27"]["Text"] = [[]]
					Toggle["27"]["Font"] = Enum.Font.SourceSans
					Toggle["27"]["Position"] = UDim2.new(0, 373, 0, 8)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle.Toggle.UICorner
					Toggle["28"] = Instance.new("UICorner", Toggle["27"])
					Toggle["28"]["CornerRadius"] = UDim.new(2, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle.Toggle.UIGradient
					Toggle["29"] = Instance.new("UIGradient", Toggle["27"])
					Toggle["29"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(75, 75, 75)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(99, 99, 99))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle.Toggle.Indicator
					Toggle["2a"] = Instance.new("TextLabel", Toggle["27"])
					Toggle["2a"]["BackgroundColor3"] = Color3.fromRGB(177, 177, 177)
					Toggle["2a"]["TextSize"] = 14
					Toggle["2a"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
					Toggle["2a"]["Size"] = UDim2.new(0, 23, 0, 20)
					Toggle["2a"]["Text"] = [[]]
					Toggle["2a"]["Name"] = [[Indicator]]
					Toggle["2a"]["Font"] = Enum.Font.SourceSans
					Toggle["2a"]["Position"] = UDim2.new(0, 0,0, -1)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle.Toggle.Indicator.UICorner
					Toggle["2b"] = Instance.new("UICorner", Toggle["2a"])
					Toggle["2b"]["CornerRadius"] = UDim.new(1, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle.Label
					Toggle["2d"] = Instance.new("TextLabel", Toggle["24"])
					Toggle["2d"]["BorderSizePixel"] = 0
					Toggle["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left
					Toggle["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Toggle["2d"]["TextSize"] = 13
					Toggle["2d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Toggle["2d"]["Size"] = UDim2.new(0, 301, 0, 33)
					Toggle["2d"]["Text"] = options.Name
					Toggle["2d"]["Name"] = [[Label]]
					Toggle["2d"]["Font"] = Enum.Font.GothamMedium
					Toggle["2d"]["BackgroundTransparency"] = 1
					Toggle["2d"]["Position"] = UDim2.new(0, 21, 0, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Toggle.UIStroke
					Toggle["2e"] = Instance.new("UIStroke", Toggle["24"])
					Toggle["2e"]["Color"] = Color3.fromRGB(43, 43, 43)
				end

				-- Handler
				do
					Toggle["24"].MouseEnter:Connect(function()
						Library:Tween(Toggle["2e"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(65, 65, 65)}
						})

						Toggle.Hover = true
					end)

					Toggle["24"].MouseLeave:Connect(function()
						Library:Tween(Toggle["2e"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(43, 43, 43)}
						})

						Toggle.Hover = false
					end)

					UserInputService.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
							Library:Tween(Toggle["2e"], {
								Length = 0.2,
								Goal = {Color = Color3.fromRGB(86, 86, 86)}
							})
							
							Toggle:Set()
							task.wait(0.2)
							if Toggle.Hover then
								Library:Tween(Toggle["2e"], {
									Length = 0.2,
									Goal = {Color = Color3.fromRGB(65, 65, 65)}
								})
							else
								Library:Tween(Toggle["2e"], {
									Length = 0.2,
									Goal = {Color = Color3.fromRGB(43, 43, 43)}
								})
							end
						end
					end)
				end

				-- Methods
				do
					function Toggle:Toggle(toggle)
						if toggle then
							Toggle.Bool = true
							
							task.spawn(function()
								Library:Tween(Toggle["2a"], {
									Length = 0.2,
									Goal = {Position = UDim2.new(0, 15,0, -1)}
								})
								
								Library:Tween(Toggle["2a"], {
									Length = 0.2,
									Goal = {BackgroundColor3 = Color3.fromRGB(105, 53, 189)}
								})
							end)
							
						else
							Toggle.Bool = false
							
							task.spawn(function()
								Library:Tween(Toggle["2a"], {
									Length = 0.2,
									Goal = {Position = UDim2.new(0, 0,0, -1)}
								})
								
								
								Library:Tween(Toggle["2a"], {
									Length = 0.2,
									Goal = {BackgroundColor3 = Color3.fromRGB(177, 177, 177)}
								})
							end)
						end
						
						task.spawn(function()
							options.Callback(Toggle.Bool)
						end)
					end
					
					function Toggle:Set(bool)
						if type(bool) == "boolean" then
							Toggle:Toggle(bool)
						else
							if Toggle.Bool then
								Toggle:Toggle(false)
							else
								Toggle:Toggle(true)
							end
						end
					end
					
					function Toggle:SetName(name)
						Toggle["2d"]["Text"] = name
					end
				end
				
				Toggle:Set(options.Default)
				
				task.spawn(function()
					Library:ResizeSection(Section["1e"])
					task.wait(1)
					Library:ResizeCanvas(Tab["1d"])
				end)

				return Toggle
			end
			
			function Section:Slider(options)
				options = Library:Place_Defaults({
					Name = "Slider",
					Max = 100,
					Min = 0,
					Default = 50,
					Callback = function() return end
				}, options or {})

				local Slider = {
					Hover = false,
					OldVal = options.Default,
					TextboxHover = false
				}

				do
					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider
					Slider["36"] = Instance.new("Frame", Section["21"])
					Slider["36"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Slider["36"]["Size"] = UDim2.new(0, 423, 0, 34)
					Slider["36"]["Position"] = UDim2.new(0, 17, 0, 104)
					Slider["36"]["Name"] = [[Slider]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.UICorner
					Slider["37"] = Instance.new("UICorner", Slider["36"])
					Slider["37"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.UIGradient
					Slider["38"] = Instance.new("UIGradient", Slider["36"])
					Slider["38"]["Rotation"] = 270
					Slider["38"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 40, 40)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(45, 45, 45))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Label
					Slider["39"] = Instance.new("TextLabel", Slider["36"])
					Slider["39"]["BorderSizePixel"] = 0
					Slider["39"]["TextXAlignment"] = Enum.TextXAlignment.Left
					Slider["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Slider["39"]["TextSize"] = 13
					Slider["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Slider["39"]["Size"] = UDim2.new(0, 301, 0, 33)
					Slider["39"]["Text"] = options.Name
					Slider["39"]["Name"] = [[Label]]
					Slider["39"]["Font"] = Enum.Font.GothamMedium
					Slider["39"]["BackgroundTransparency"] = 1
					Slider["39"]["Position"] = UDim2.new(0, 21, 0, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Slider
					Slider["3a"] = Instance.new("Frame", Slider["36"])
					Slider["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Slider["3a"]["Size"] = UDim2.new(0, 136, 0, 10)
					Slider["3a"]["Position"] = UDim2.new(0, 229, 0, 12)
					Slider["3a"]["Name"] = [[Slider]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Slider.UICorner
					Slider["3b"] = Instance.new("UICorner", Slider["3a"])
					Slider["3b"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Slider.Sliderbackground
					Slider["3c"] = Instance.new("Frame", Slider["3a"])
					Slider["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Slider["3c"]["Size"] = UDim2.new(0.49264705181121826, 0, 0.9444444179534912, 0)
					Slider["3c"]["Name"] = [[Sliderbackground]]
					Slider["3c"]["BorderSizePixel"] = 0

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Slider.Sliderbackground.UICorner
					Slider["3d"] = Instance.new("UICorner", Slider["3c"])
					Slider["3d"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Slider.Sliderbackground.ThemeColorGradient
					Slider["3e"] = Instance.new("UIGradient", Slider["3c"])
					Slider["3e"]["Name"] = [[ThemeColorGradient]]
					Slider["3e"]["Rotation"] = 90
					Slider["3e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(132, 65, 232)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(105, 52, 185))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Slider.UIGradient
					Slider["3f"] = Instance.new("UIGradient", Slider["3a"])
					Slider["3f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(75, 75, 75)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(99, 99, 99))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.UIStroke
					Slider["40"] = Instance.new("UIStroke", Slider["36"])
					Slider["40"]["Color"] = Color3.fromRGB(43, 43, 43)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.TextBox
					Slider["3g"] = Instance.new("TextBox", Slider["36"])
					Slider["3g"]["CursorPosition"] = -1
					Slider["3g"]["PlaceholderColor3"] = Color3.fromRGB(127, 127, 127)
					Slider["3g"]["RichText"] = true
					Slider["3g"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Slider["3g"]["TextSize"] = 11
					Slider["3g"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51)
					Slider["3g"]["PlaceholderText"] = [[]]
					Slider["3g"]["Size"] = UDim2.new(0, 45, 0, 18)
					Slider["3g"]["Text"] = [[]]
					Slider["3g"]["Position"] = UDim2.new(0, 373, 0, 6)
					Slider["3g"]["Font"] = Enum.Font.Gotham
					Slider["3g"]["BorderSizePixel"] = 0
				end

				-- Handler
				do
					local MouseDown
					
					Slider["36"].MouseEnter:Connect(function()
						Slider.Hover = true
						
						Library:Tween(Slider["40"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(65, 65, 65)}
						})
					end)
					
					Slider["36"].MouseLeave:Connect(function()
						Slider.Hover = false
						
						Library:Tween(Slider["40"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(43, 43, 43)}
						})
					end)
					
					Slider["3g"].MouseEnter:Connect(function()
						Slider.TextboxHover = true
					end)
					
					Slider["3g"].MouseLeave:Connect(function()
						Slider.TextboxHover = false
					end)

					Slider["3g"].Focused:Connect(function()
						Slider["3g"]["Text"] = [[]]
						
						Library.Sliding = true
					end)

					Slider["3g"].FocusLost:Connect(function()
						local success = pcall(function()
							local NumVal = tonumber(Slider["3g"].Text)
							if NumVal <= options.Max and NumVal >= options.Min then
								Slider.OldVal = NumVal
								Slider:SetValue(NumVal)
							else
								Slider["3g"].Text = Slider.OldVal
							end
						end)

						if not success then
							Slider["3g"].Text = Slider.OldVal
						end
						
						Library.Sliding = false
					end)

					UserInputService.InputBegan:connect(function(key)
						if key.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover and not Slider.TextboxHover then
							Library.Sliding = true
							MouseDown = true

							while RunService.RenderStepped:wait() and MouseDown do
								local percentage = math.clamp((Mouse.X - Slider["3a"].AbsolutePosition.X) / (Slider["3a"].AbsoluteSize.X), 0, 1)
								local Value = ((options.Max - options.Min) * percentage) + options.Min
								Value = math.floor(Value)
								
								if Value ~= Slider.OldVal then
									options.Callback(Value)
								end
								Slider.OldVal = Value
								Slider["3g"]["Text"] = Value
								
								Library:Tween(Slider["3c"], {
									Length = 0.06,
									Goal = {Size = UDim2.fromScale(((Value - options.Min) / (options.Max - options.Min)), 1)}
								})
							end
							Library.Sliding = false
						end
					end)

					UserInputService.InputEnded:connect(function(key)
						if key.UserInputType == Enum.UserInputType.MouseButton1 then
							MouseDown = false
						end
					end)
				end

				-- Methods
				do
					function Slider:SetValue(Value)
						Value = math.floor(Value)

						Library:Tween(Slider["3c"], {
							Length = 1,
							Goal = {Size = UDim2.fromScale(((Value - options.Min) / (options.Max - options.Min)), 1)}
						})

						Slider["3g"]["Text"] = Value
						Slider.OldVal = Value
						options.Callback(Value)
					end

					function Slider:SetName(name)
						Slider["39"]["Text"] = name
					end
				end

				task.spawn(function()
					Slider:SetValue(options.Default)
					Library:ResizeSection(Section["1e"])
					task.wait(1)
					Library:ResizeCanvas(Tab["1d"])
				end)

				return Slider
			end
			
			function Section:Keybind(options)
				options = Library:Place_Defaults({
					Name = "Keybind",
					Default = Enum.KeyCode.Return,
					Callback = function() return end,
					UpdateKeyCallback = function() return end
				}, options or {})

				local Keybind = {
					Focused = false,
					Keybind = options.Default
				}

				do
					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Keybind
					Keybind["59"] = Instance.new("Frame", Section["21"])
					Keybind["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Keybind["59"]["Size"] = UDim2.new(0, 423, 0, 34)
					Keybind["59"]["Position"] = UDim2.new(0, 17, 0, 104)
					Keybind["59"]["Name"] = [[Keybind]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Keybind.UICorner
					Keybind["5a"] = Instance.new("UICorner", Keybind["59"])
					Keybind["5a"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Keybind.UIGradient
					Keybind["5b"] = Instance.new("UIGradient", Keybind["59"])
					Keybind["5b"]["Rotation"] = 270
					Keybind["5b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 40, 40)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(45, 45, 45))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Keybind.Label
					Keybind["5c"] = Instance.new("TextLabel", Keybind["59"])
					Keybind["5c"]["BorderSizePixel"] = 0
					Keybind["5c"]["TextXAlignment"] = Enum.TextXAlignment.Left
					Keybind["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Keybind["5c"]["TextSize"] = 13
					Keybind["5c"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Keybind["5c"]["Size"] = UDim2.new(0, 301, 0, 33)
					Keybind["5c"]["Text"] = options.Name
					Keybind["5c"]["Name"] = [[Label]]
					Keybind["5c"]["Font"] = Enum.Font.GothamMedium
					Keybind["5c"]["BackgroundTransparency"] = 1
					Keybind["5c"]["Position"] = UDim2.new(0, 21, 0, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Keybind.TextButton
					Keybind["5d"] = Instance.new("TextButton", Keybind["59"])
					Keybind["5d"]["AutoButtonColor"] = false
					Keybind["5d"]["TextSize"] = 11
					Keybind["5d"]["BackgroundColor3"] = Color3.fromRGB(195, 195, 195)
					Keybind["5d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Keybind["5d"]["Size"] = UDim2.new(0, 80, 0, 21)
					Keybind["5d"]["Text"] = [[]]
					Keybind["5d"]["Font"] = Enum.Font.Gotham
					Keybind["5d"]["Position"] = UDim2.new(0.7900000214576721, 0, 0.17599999904632568, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Keybind.TextButton.UICorner
					Keybind["5e"] = Instance.new("UICorner", Keybind["5d"])
					Keybind["5e"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Keybind.TextButton.UIGradient
					Keybind["5f"] = Instance.new("UIGradient", Keybind["5d"])
					Keybind["5f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(75, 75, 75)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(99, 99, 99))}
					
					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Keybind.UIStroke
					Keybind["5g"] = Instance.new("UIStroke", Keybind["59"])
					Keybind["5g"]["Color"] = Color3.fromRGB(43, 43, 43)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Keybind.TextButton.TextLabel
					Keybind["60"] = Instance.new("TextLabel", Keybind["5d"])
					Keybind["60"]["BorderSizePixel"] = 0
					Keybind["60"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Keybind["60"]["TextSize"] = 10
					Keybind["60"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Keybind["60"]["Size"] = UDim2.new(0, 79, 0, 21)
					Keybind["60"]["Text"] = [[LeftShift]]
					Keybind["60"]["Font"] = Enum.Font.Gotham
					Keybind["60"]["BackgroundTransparency"] = 1

					local keybindText = string.gsub(tostring(Keybind.Keybind), "Enum.KeyCode.", "")

					Keybind["60"]["Text"] = keybindText
				end

				-- Methods
				do
					Keybind["59"].MouseEnter:Connect(function()
						Library:Tween(Keybind["5g"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(65, 65, 65)}
						})
					end)
					
					

					Keybind["59"].MouseLeave:Connect(function()
						Library:Tween(Keybind["5g"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(43, 43, 43)}
						})
					end)

					Keybind["5d"].MouseButton1Click:Connect(function()
						Keybind.Focused = true

						Keybind["60"]["Text"] = "..."
					end)

					UserInputService.InputBegan:Connect(function(input, GameProcess)
						if input.UserInputType == Enum.UserInputType.Keyboard then
							if input.KeyCode == Keybind.Keybind then
								pcall(function()
									options.Callback()
								end)
							end

							if Keybind.Focused then
								Keybind.Keybind = input.KeyCode
								local keybindText = string.gsub(tostring(Keybind.Keybind), "Enum.KeyCode.", "")
								Keybind["60"]["Text"] = keybindText
								pcall(function()
									options.UpdateKeyCallback(input.KeyCode)
								end)

								Keybind.Focused = false
							end
						end
					end)

					function Keybind:SetName(name)
						Keybind["5c"]["Text"] = name
					end
				end

				task.spawn(function()
					Library:ResizeSection(Section["1e"])
					task.wait(1)
					Library:ResizeCanvas(Tab["1d"])
				end)
				
				return Keybind
			end
			
			function Section:SmallTextbox(options)
				options = Library:Place_Defaults({
					Name = "Small Textbox",
					Default = "Text",
					Callback = function() return end
				}, options or {})

				local Textbox = {
					Hover = false
				}

				do
					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1
					Textbox["2e"] = Instance.new("Frame", Section["21"])
					Textbox["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Textbox["2e"]["Size"] = UDim2.new(0, 423, 0, 34)
					Textbox["2e"]["Position"] = UDim2.new(0, 17, 0, 104)
					Textbox["2e"]["Name"] = [[Textbox1]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1.UICorner
					Textbox["2f"] = Instance.new("UICorner", Textbox["2e"])
					Textbox["2f"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1.UIGradient
					Textbox["30"] = Instance.new("UIGradient", Textbox["2e"])
					Textbox["30"]["Rotation"] = 270
					Textbox["30"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 40, 40)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(45, 45, 45))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1.Label
					Textbox["31"] = Instance.new("TextLabel", Textbox["2e"])
					Textbox["31"]["BorderSizePixel"] = 0
					Textbox["31"]["TextXAlignment"] = Enum.TextXAlignment.Left
					Textbox["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Textbox["31"]["TextSize"] = 13
					Textbox["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Textbox["31"]["Size"] = UDim2.new(0, 301, 0, 33)
					Textbox["31"]["Text"] = options.Name
					Textbox["31"]["Name"] = [[Label]]
					Textbox["31"]["Font"] = Enum.Font.GothamMedium
					Textbox["31"]["BackgroundTransparency"] = 1
					Textbox["31"]["Position"] = UDim2.new(0, 21, 0, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1.UIStroke
					Textbox["32"] = Instance.new("UIStroke", Textbox["2e"])
					Textbox["32"]["Color"] = Color3.fromRGB(43, 43, 43)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1.Frame
					Textbox["33"] = Instance.new("Frame", Textbox["2e"])
					Textbox["33"]["BorderSizePixel"] = 0
					Textbox["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Textbox["33"]["BackgroundTransparency"] = 1
					Textbox["33"]["Size"] = UDim2.new(0.9810874462127686, 0, 1, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1.Frame.TextBox
					Textbox["34"] = Instance.new("TextBox", Textbox["33"])
					Textbox["34"]["PlaceholderColor3"] = Color3.fromRGB(127, 127, 127)
					Textbox["34"]["RichText"] = true
					Textbox["34"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Textbox["34"]["TextSize"] = 11
					Textbox["34"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51)
					Textbox["34"]["Size"] = UDim2.new(0, 92, 0, 21)
					Textbox["34"]["Text"] = [[]]
					Textbox["34"]["Position"] = UDim2.new(0.7612293362617493, 0, 0.1764705926179886, 0)
					Textbox["34"]["Font"] = Enum.Font.Gotham
					Textbox["34"]["TextWrapped"] = false
					Textbox["34"]["PlaceholderText"] = [[...]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1.Frame.TextBox.UICorner
					Textbox["35"] = Instance.new("UICorner", Textbox["34"])
					Textbox["35"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1.Frame.TextBox.UIGradient
					Textbox["36"] = Instance.new("UIGradient", Textbox["34"])
					Textbox["36"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(75, 75, 75)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(99, 99, 99))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Textbox1.Frame.UIListLayout
					Textbox["37"] = Instance.new("UIListLayout", Textbox["33"])
					Textbox["37"]["VerticalAlignment"] = Enum.VerticalAlignment.Center
					Textbox["37"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
					Textbox["37"]["SortOrder"] = Enum.SortOrder.LayoutOrder
				end

				-- Handler
				do			
					Textbox["2e"].MouseEnter:Connect(function()
						Library:Tween(Textbox["32"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(65, 65, 65)}
						})
					end)

					Textbox["2e"].MouseLeave:Connect(function()
						Library:Tween(Textbox["32"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(43, 43, 43)}
						})
					end)
					

					Textbox["34"].Focused:Connect(function()						
						Textbox["34"].Text = ""
						
						Library.Sliding = true
					end)
					
					Textbox["34"].FocusLost:Connect(function()						
						Library.Sliding = false
						
						task.spawn(function()
							options.Callback(Textbox["34"].Text)
						end)
					end)
					
					Textbox["34"]:GetPropertyChangedSignal("Text"):Connect(function()
						if Textbox["34"].Text == "" then
							Library:Tween(Textbox["34"], {
								Length = 0.2,
								Goal = {Size = UDim2.new(0, 35, 0, 21)}
							})
						else
							local Bound = TextService:GetTextSize(Textbox["34"].Text, Textbox["34"].TextSize, Textbox["34"].Font, Vector2.new(Textbox["34"].AbsoluteSize.X,Textbox["34"].AbsoluteSize.Y))

							Library:Tween(Textbox["34"], {
								Length = 0.2,
								Goal = {Size = UDim2.new(0, (Bound.X + 18), 0, 21)}
							})
						end
					end)
				end

				-- Methods
				do
					function Textbox:SetText(Text)
						Textbox["34"].Text = Text
					end
					
					function Textbox:SetName(Name)
						Textbox["31"].Text = Name
					end
				end
				
				Textbox:SetText(options.Default)
				
				do
					if Textbox["34"].Text == "" then
						Library:Tween(Textbox["34"], {
							Length = 0.2,
							Goal = {Size = UDim2.new(0, 35, 0, 21)}
						})
					else
						local Bound = TextService:GetTextSize(Textbox["34"].Text, Textbox["34"].TextSize, Textbox["34"].Font, Vector2.new(Textbox["34"].AbsoluteSize.X,Textbox["34"].AbsoluteSize.Y))

						Library:Tween(Textbox["34"], {
							Length = 0.2,
							Goal = {Size = UDim2.new(0, (Bound.X + 18), 0, 21)}
						})
					end
				end

				task.spawn(function()
					Library:ResizeSection(Section["1e"])
					task.wait(1)
					Library:ResizeCanvas(Tab["1d"])
				end)

				return Textbox
			end
			
			function Section:Dropdown(options)
				options = Library:Place_Defaults({
					Name = "Dropdown",
					Items = {},
					Callback = function(item) return end
				}, options or {})

				local Dropdown = {
					Items = options.Items,
					SelectedItem = nil,
					ContainerOpened = false,
					NameText = options.Name,
					Hover = false
				}

				do
					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown
					Dropdown["46"] = Instance.new("Frame", Section["21"])
					Dropdown["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Dropdown["46"]["Size"] = UDim2.new(0, 423, 0, 34)
					Dropdown["46"]["ClipsDescendants"] = true
					Dropdown["46"]["Position"] = UDim2.new(0, 0, 0, 117)
					Dropdown["46"]["Name"] = [[Dropdown]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.UICorner
					Dropdown["47"] = Instance.new("UICorner", Dropdown["46"])
					Dropdown["47"]["CornerRadius"] = UDim.new(0, 4)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Label
					Dropdown["48"] = Instance.new("TextLabel", Dropdown["46"])
					Dropdown["48"]["BorderSizePixel"] = 0
					Dropdown["48"]["TextXAlignment"] = Enum.TextXAlignment.Left
					Dropdown["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Dropdown["48"]["TextSize"] = 13
					Dropdown["48"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Dropdown["48"]["Size"] = UDim2.new(0, 301, 0, 33)
					Dropdown["48"]["Text"] = [[Dropdown]]
					Dropdown["48"]["Name"] = [[Label]]
					Dropdown["48"]["Font"] = Enum.Font.GothamMedium
					Dropdown["48"]["BackgroundTransparency"] = 1
					Dropdown["48"]["Position"] = UDim2.new(0, 21, 0, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Open
					Dropdown["49"] = Instance.new("ImageButton", Dropdown["46"])
					Dropdown["49"]["ScaleType"] = Enum.ScaleType.Crop
					Dropdown["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Dropdown["49"]["Image"] = [[rbxassetid://11400266375]]
					Dropdown["49"]["Size"] = UDim2.new(0, 14, 0, 10)
					Dropdown["49"]["Name"] = [[Open]]
					Dropdown["49"]["Position"] = UDim2.new(0, 397, 0, 10)
					Dropdown["49"]["BackgroundTransparency"] = 1

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.UIStroke
					Dropdown["4a"] = Instance.new("UIStroke", Dropdown["46"])
					Dropdown["4a"]["Color"] = Color3.fromRGB(43, 43, 43)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Container
					Dropdown["4b"] = Instance.new("Frame", Dropdown["46"])
					Dropdown["4b"]["BorderSizePixel"] = 0
					Dropdown["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Dropdown["4b"]["BackgroundTransparency"] = 1
					Dropdown["4b"]["Size"] = UDim2.new(0, 423, 0, 72)
					Dropdown["4b"]["Position"] = UDim2.new(0, 0, 0, 39)
					Dropdown["4b"]["Name"] = [[Container]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Container.UIListLayout
					Dropdown["4c"] = Instance.new("UIListLayout", Dropdown["4b"])
					Dropdown["4c"]["Padding"] = UDim.new(0, 4)
					Dropdown["4c"]["SortOrder"] = Enum.SortOrder.LayoutOrder

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Container.UIPadding
					Dropdown["57"] = Instance.new("UIPadding", Dropdown["4b"])
					Dropdown["57"]["PaddingLeft"] = UDim.new(0, 8)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.UIGradient
					Dropdown["58"] = Instance.new("UIGradient", Dropdown["46"])
					Dropdown["58"]["Rotation"] = 270
					Dropdown["58"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 40, 40)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(45, 45, 45))}

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Frame
					Dropdown["59"] = Instance.new("Frame", Dropdown["46"])
					Dropdown["59"]["BorderSizePixel"] = 0
					Dropdown["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Dropdown["59"]["BackgroundTransparency"] = 1
					Dropdown["59"]["Size"] = UDim2.new(0, 390, 0, 34)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Frame.UIListLayout
					Dropdown["5a"] = Instance.new("UIListLayout", Dropdown["59"])
					Dropdown["5a"]["VerticalAlignment"] = Enum.VerticalAlignment.Center
					Dropdown["5a"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
					Dropdown["5a"]["SortOrder"] = Enum.SortOrder.LayoutOrder

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Frame.TextLabel
					Dropdown["5b"] = Instance.new("TextLabel", Dropdown["59"])
					Dropdown["5b"]["BorderSizePixel"] = 0
					Dropdown["5b"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51)
					Dropdown["5b"]["TextSize"] = 9
					Dropdown["5b"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
					Dropdown["5b"]["Size"] = UDim2.new(0, 50, 0, 15)
					Dropdown["5b"]["Font"] = Enum.Font.Gotham

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Frame.TextLabel.UICorner
					Dropdown["5c"] = Instance.new("UICorner", Dropdown["5b"])
					Dropdown["5c"]["CornerRadius"] = UDim.new(0, 4)
				end

				-- Handler
				do					
					Dropdown["46"].MouseEnter:Connect(function()
						Dropdown.Hover = true
						
						Library:Tween(Dropdown["4a"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(65, 65, 65)}
						})
					end)

					Dropdown["46"].MouseLeave:Connect(function()
						Dropdown.Hover = false
						
						Library:Tween(Dropdown["4a"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(43, 43, 43)}
						})
					end)
					
					UserInputService.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
							Library:Tween(Dropdown["4a"], {
								Length = 0.2,
								Goal = {Color = Color3.fromRGB(86, 86, 86)}
							})

							if Dropdown.Hover then
								Library:Tween(Dropdown["4a"], {
									Length = 0.2,
									Goal = {Color = Color3.fromRGB(65, 65, 65)}
								})
							else
								Library:Tween(Dropdown["4a"], {
									Length = 0.2,
									Goal = {Color = Color3.fromRGB(43, 43, 43)}
								})
							end
							
							do
								if Dropdown.ContainerOpened then
									Dropdown.ContainerOpened = false
									
									Library:Tween(Dropdown["46"], {
										Length = 0.5,
										Goal = {Size = UDim2.fromOffset(423, 34)}
									})
									
									task.wait(0.7)

									task.spawn(function()
										Library:ResizeSection(Section["1e"])
										task.wait(0.7)
										Library:ResizeCanvas(Tab["1d"])
									end)
								else
									Dropdown.ContainerOpened = true
									
									Dropdown:ResizeOpenedFrame()
								end

								task.wait(0.7)

								task.spawn(function()
									Library:ResizeCanvas(Tab["1d"])
								end)
							end
						end
					end)
				end

				-- Methods
				do
					
					function Dropdown:AddItem(value)
						local DropdownOption = {
							Hover = false,
							CallbackVal = value
						}

						do
							-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Container.Option 1
							DropdownOption["4d"] = Instance.new("Frame", Dropdown["4b"])
							DropdownOption["4d"]["BackgroundColor3"] = Color3.fromRGB(149, 149, 149)
							DropdownOption["4d"]["Size"] = UDim2.new(0, 407, 0, 27)
							DropdownOption["4d"]["Position"] = UDim2.new(0, 7, 0, 22)
							DropdownOption["4d"]["Name"] = [[Option 1]]

							-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Container.Option 1.UICorner
							DropdownOption["4e"] = Instance.new("UICorner", DropdownOption["4d"])
							DropdownOption["4e"]["CornerRadius"] = UDim.new(0, 4)

							-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Container.Option 1.Label
							DropdownOption["4f"] = Instance.new("TextLabel", DropdownOption["4d"])
							DropdownOption["4f"]["BorderSizePixel"] = 0
							DropdownOption["4f"]["TextXAlignment"] = Enum.TextXAlignment.Left
							DropdownOption["4f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
							DropdownOption["4f"]["TextSize"] = 13
							DropdownOption["4f"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
							DropdownOption["4f"]["Size"] = UDim2.new(0, 301, 0, 33)
							DropdownOption["4f"]["Text"] = tostring(value)
							DropdownOption["4f"]["Name"] = [[Label]]
							DropdownOption["4f"]["Font"] = Enum.Font.GothamMedium
							DropdownOption["4f"]["BackgroundTransparency"] = 1
							DropdownOption["4f"]["Position"] = UDim2.new(0, 14, 0, -3)

							-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Container.Option 1.UIStroke
							DropdownOption["50"] = Instance.new("UIStroke", DropdownOption["4d"])
							DropdownOption["50"]["Color"] = Color3.fromRGB(43, 43, 43)

							-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Dropdown.Container.Option 1.UIGradient
							DropdownOption["51"] = Instance.new("UIGradient", DropdownOption["4d"])
							DropdownOption["51"]["Rotation"] = 270
							DropdownOption["51"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(86, 86, 86)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(89, 89, 89))}
						end

						DropdownOption["4d"].MouseEnter:Connect(function()
							DropdownOption.Hover = true

							Library:Tween(DropdownOption["50"], {
								Length = 0.5,
								Goal = {Color = Color3.fromRGB(65, 65, 65)}
							})
						end)

						DropdownOption["4d"].MouseLeave:Connect(function()
							DropdownOption.Hover = false

							Library:Tween(DropdownOption["50"], {
								Length = 0.5,
								Goal = {Color = Color3.fromRGB(43, 43, 43)}
							})
						end)

						UserInputService.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 and DropdownOption.Hover then
								Library:Tween(DropdownOption["50"], {
									Length = 0.2,
									Goal = {Color = Color3.fromRGB(86, 86, 86)}
								})

								task.spawn(function()
									options.Callback(DropdownOption.CallbackVal)
								end)

								if DropdownOption.Hover then
									Library:Tween(DropdownOption["50"], {
										Length = 0.2,
										Goal = {Color = Color3.fromRGB(65, 65, 65)}
									})
								else
									Library:Tween(DropdownOption["50"], {
										Length = 0.2,
										Goal = {Color = Color3.fromRGB(43, 43, 43)}
									})
								end
								
								Dropdown.SelectedItem = DropdownOption.CallbackVal
								Dropdown["5b"].Text = tostring(Dropdown.SelectedItem)
								
								local Bound = TextService:GetTextSize(Dropdown["5b"].Text, Dropdown["5b"].TextSize, Dropdown["5b"].Font, Vector2.new(Dropdown["5b"].AbsoluteSize.X, Dropdown["5b"].AbsoluteSize.Y))

								Library:Tween(Dropdown["5b"], {
									Length = 0.2,
									Goal = {Size = UDim2.new(0, (Bound.X + 14), 0, 21)}
								})
							end
						end)
						
						if Dropdown.SelectedItem == nil then
							Dropdown.SelectedItem = DropdownOption.CallbackVal
							Dropdown["5b"].Text = tostring(Dropdown.SelectedItem)
							
							local Bound = TextService:GetTextSize(Dropdown["5b"].Text, Dropdown["5b"].TextSize, Dropdown["5b"].Font, Vector2.new(Dropdown["5b"].AbsoluteSize.X, Dropdown["5b"].AbsoluteSize.Y))

							Library:Tween(Dropdown["5b"], {
								Length = 0.2,
								Goal = {Size = UDim2.new(0, (Bound.X + 14), 0, 21)}
							})
						end
						
						if Dropdown.ContainerOpened then
							Dropdown:ResizeOpenedFrame()
						end

						task.wait(0.6)

						task.spawn(function()
							Library:ResizeSection(Section["1e"])
							task.wait(1)
							Library:ResizeCanvas(Tab["1d"])
						end)
					end
					
					function Dropdown:Clear()
						for i, v in pairs(Dropdown["4b"]:GetChildren()) do
							if v:IsA("Frame") then
								v:Destroy()
							end
						end
						
						local FrameYOffset = 34 + 4

						if Dropdown.ContainerOpened then
							Dropdown:ResizeOpenedFrame()
						end
						
						task.wait(0.6)
						
						task.spawn(function()
							Library:ResizeSection(Section["1e"])
							task.wait(1)
							Library:ResizeCanvas(Tab["1d"])
						end)
					end
					
					function Dropdown:UpdateList(options)
						options = Library:Place_Defaults({
							Items = {},
							Replace = true
						}, options or {})
						
						if options.Replace then
							for i, v in pairs(Dropdown["4b"]:GetChildren()) do
								if v:IsA("Frame") then
									v:Destroy()
								end
							end
						end
						
						for i, v in pairs(options.Items) do
							Dropdown:AddItem(v)
						end
						
						if Dropdown.ContainerOpened then
							Dropdown:ResizeOpenedFrame()
						end

						task.wait(0.6)

						task.spawn(function()
							Library:ResizeSection(Section["1e"])
							task.wait(1)
							Library:ResizeCanvas(Tab["1d"])
						end)
					end
					
					function Dropdown:ResizeOpenedFrame()
						local FrameYOffset

						do
							local NumChild = 0

							for i, v in pairs(Dropdown["4b"]:GetChildren()) do
								if v:IsA("Frame") then
									NumChild += 1
								end
							end

							FrameYOffset = 27 * NumChild + 4 * NumChild + 4
						end
						
						local SectionContainer = Section["21"]

						local NumChild = 0
						local ChildOffset = 0

						for i, v in pairs(SectionContainer:GetChildren()) do
							if v:IsA("Frame") then
								NumChild += 1
								ChildOffset = ChildOffset + v.Size.Y.Offset
							end
						end

						local NumChildOffset = NumChild * 5

						if Dropdown.ContainerOpened then
							NumChildOffset += FrameYOffset
						else
							NumChildOffset -= FrameYOffset
						end

						local ContainerSize = NumChildOffset + ChildOffset + 10
						local SectionSize = ContainerSize + 26

						Library:Tween(SectionContainer, {
							Length = 0.5,
							Goal = {Size = UDim2.new(0, 458, 0, ContainerSize)}
						})

						Library:Tween(Section["1e"], {
							Length = 0.5,
							Goal = {Size = UDim2.new(0, 458, 0, SectionSize)}
						})
						
						do
							local NumChild = 0

							for i, v in pairs(Dropdown["4b"]:GetChildren()) do
								if v:IsA("Frame") then
									NumChild += 1
								end
							end

							local FrameYOffset = 27 * NumChild + 4 * NumChild + 38

							Library:Tween(Dropdown["46"], {
								Length = 0.5,
								Goal = {Size = UDim2.fromOffset(423, FrameYOffset)}
							})
						end
					end
				end
				
				do
					task.spawn(function()
						for i, v in pairs(options.Items) do
							Dropdown:AddItem(v)
						end
					end)
				end

				task.spawn(function()
					Library:ResizeSection(Section["1e"])
					task.wait(1)
					Library:ResizeCanvas(Tab["1d"])
				end)

				return Dropdown
			end
			
			--[[
			function Section:Template(options)
				options = Library:Place_Defaults({
					Name = "Template",
					Callback = function() return end
				}, options or {})

				local Template = {
					Hover = false
				}

				do
				end

				-- Handler
				do
				end

				-- Methods
				do
					
				end

				task.spawn(function()
					Library:ResizeSection(Section["1e"])
					task.wait(1)
					Library:ResizeCanvas(Tab["1d"])
				end)

				return Template
			end
			]]--
			
			task.spawn(function()
				Library:ResizeSection(Section["1e"])
				task.wait(1)
				Library:ResizeCanvas(Tab["1d"])
			end)
			
			return Section
		end
		
		-- Handler
		do	
			Tab["8"].MouseEnter:Connect(function()
				Tab.Hover = true
				
				if not Tab.Active then
					Library:Tween(Tab["8"], {
						Length = 0.5,
						Goal = {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}
					})
				end
			end)
			
			Tab["8"].MouseLeave:Connect(function()
				Tab.Hover = false
				
				if not Tab.Active then
					Library:Tween(Tab["8"], {
						Length = 0.5,
						Goal = {BackgroundColor3 = Color3.fromRGB(74, 74, 74)}
					})
				end
			end)
			
			UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 and Tab.Hover then
					if Gui.CurrentTab == Tab and not Gui.Hidden then
						Library:Tween(Gui["18"], {
							Length = 0.3,
							Goal = {Position = UDim2.new(0, 0, 0, 452)}
						})
						
						Library:Tween(Gui["18"], {
							Length = 0.3,
							Goal = {Size = UDim2.new(0, 498, 0, 0)}
						})
						
						Gui.Hidden = true
					else
						Library:Tween(Gui["18"], {
							Length = 0.3,
							Goal = {Position = UDim2.new(0, 0, 0, 0)}
						})

						Library:Tween(Gui["18"], {
							Length = 0.3,
							Goal = {Size = UDim2.new(0, 498, 0, 452)}
						})
						
						Gui.Hidden = false
					end
					
					Tab:Activate()
				end
			end)
			
			function Tab:Activate()
				if not Tab.Active then					
					if Gui.CurrentTab ~= nil then
						Gui.CurrentTab:Deactivate(Tab.Index)
					end

					Tab.Active = true

					Library:Tween(Tab["8"], {
						Length = 0.5,
						Goal = {BackgroundColor3 = options.Color}
					})
					
					if Gui.CurrentTabIndex < Tab.Index then
						task.spawn(function()
							task.wait(0.3)
							Gui["1c"]["Text"] = options.Name
							Gui["1c"]["Position"] = UDim2.new(0, 498, 0, 5)
							Tab["1d"]["Position"] = UDim2.new(0, 498, 0, 35)
							Tab["1d"]["Visible"] = true

							Library:Tween(Gui["1c"], {
								Length = 0.3,
								Goal = {Position = UDim2.new(0, 14, 0, 5)}
							})

							Library:Tween(Tab["1d"], {
								Length = 0.3,
								Goal = {Position = UDim2.new(0, 0, 0, 35)}
							})
						end)
					else
						task.spawn(function()
							task.wait(0.3)
							Gui["1c"]["Text"] = options.Name
							Gui["1c"]["Position"] = UDim2.new(0, -498, 0, 5)
							Tab["1d"]["Position"] = UDim2.new(0, -498, 0, 35)
							Tab["1d"]["Visible"] = true

							Library:Tween(Gui["1c"], {
								Length = 0.3,
								Goal = {Position = UDim2.new(0, 14, 0, 5)}
							})

							Library:Tween(Tab["1d"], {
								Length = 0.3,
								Goal = {Position = UDim2.new(0, 0, 0, 35)}
							})
						end)
					end

					Gui.CurrentTabIndex = Tab.Index
					Gui.CurrentTab = Tab
				end
			end

			function Tab:Deactivate(newtabindex)
				if Tab.Active then
					Tab.Active = false
					
					if Gui.CurrentTabIndex < newtabindex then
						Library:Tween(Tab["8"], {
							Length = 0.5,
							Goal = {BackgroundColor3 = Color3.fromRGB(74, 74, 74)}
						})

						task.spawn(function()
							Library:Tween(Gui["1c"], {
								Length = 0.3,
								Goal = {Position = UDim2.new(0, -498, 0, 5)}
							})

							Library:Tween(Tab["1d"], {
								Length = 0.3,
								Goal = {Position = UDim2.new(0, -498, 0, 35)}
							})

							task.wait(0.3)
							Tab["1d"]["Visible"] = false
						end)
					else
						Library:Tween(Tab["8"], {
							Length = 0.5,
							Goal = {BackgroundColor3 = Color3.fromRGB(74, 74, 74)}
						})

						task.spawn(function()
							Library:Tween(Gui["1c"], {
								Length = 0.3,
								Goal = {Position = UDim2.new(0, 498, 0, 5)}
							})

							Library:Tween(Tab["1d"], {
								Length = 0.3,
								Goal = {Position = UDim2.new(0, 498, 0, 35)}
							})

							task.wait(0.3)
							Tab["1d"]["Visible"] = false
						end)
					end
				end
			end

			if Gui.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		return Tab
	end
	
	-- Handler
	do
		UserInputService.InputBegan:Connect(function(input)
			if Library.MainFrameHover then
				if input.UserInputType == Enum.UserInputType.MouseButton1 and not Library.Sliding then
					local ObjectPosition = Vector2.new(Mouse.X - Gui["2"].AbsolutePosition.X, Mouse.Y - Gui["2"].AbsolutePosition.Y)
					
					while RunService.RenderStepped:wait() and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						if not Library.Sliding then
							Library:Tween(Gui["2"], {
								Goal = {Position = UDim2.fromOffset(Mouse.X - ObjectPosition.X + (Gui["2"].Size.X.Offset * Gui["2"].AnchorPoint.X), Mouse.Y - ObjectPosition.Y + (Gui["2"].Size.Y.Offset * Gui["2"].AnchorPoint.Y))},
								Style = Enum.EasingStyle.Linear,
								Direction = Enum.EasingDirection.InOut,
								Length = Library.DragSpeed	
							})
						end
					end
				end
			end
		end)
		
		Gui["2"].MouseEnter:Connect(function()
			Library.MainFrameHover = true
		end)

		Gui["2"].MouseLeave:Connect(function()
			Library.MainFrameHover = false
		end)
	end
	
	-- Nav Clock
	do
		task.spawn(function()
			while wait() do
				local t = tick()
				local sec = math.floor(t % 60)
				local min = math.floor((t/60)% 60)
				local hour = math.floor((t/3600)% 24)
				
				if string.len(sec) < 2 then 
					sec = "0" .. tostring(sec) 
				end

				if string.len(min) < 2 then 
					min = "0" .. tostring(min) 
				end
				
				if string.len(hour) < 2 then 
					hour = "0" .. tostring(hour) 
				end

				Gui["5"]["Text"] = hour .. ":" .. min..":"..sec
			end
		end)
	end
	
	-- Toggle Handler
	function Gui:Toggled(bool)
		if not Library.Loaded then
			return
		end
		
		Gui.TweeningToggle = true
		if (bool == nil) then
			if Gui["2"].Visible then
				Library:Tween(Gui["2"], {
					Length = 1,
					Goal = {Size = UDim2.new(0, 498, 0, 0)}
				})

				task.wait(1)
				Gui["2"].Visible = false
			else
				Gui["2"].Visible = true
				Library:Tween(Gui["2"], {
					Length = 1,
					Goal = {Size = UDim2.new(0, 498, 0, 496)}
				})

				task.wait(1)
			end
		elseif bool then
			Gui["2"].Visible = true
			Library:Tween(Gui["2"], {
				Length = 1,
				Goal = {Size = UDim2.new(0, 498, 0, 496)}
			})

			task.wait(1)
		elseif not bool then
			Library:Tween(Gui["2"], {
				Length = 1,
				Goal = {Size = UDim2.new(0, 498, 0, 0)}
			})

			task.wait(1)
			Gui["2"].Visible = false
		end
		
		Gui.TweeningToggle = false
	end
	
	function Gui:TaskBarOnly(bool)		
		if bool then
			Library:Tween(Gui["18"], {
				Length = 0.3,
				Goal = {Position = UDim2.new(0, 0, 0, 452)}
			})

			Library:Tween(Gui["18"], {
				Length = 0.3,
				Goal = {Size = UDim2.new(0, 498, 0, 0)}
			})

			Gui.Hidden = true
		else
			Library:Tween(Gui["18"], {
				Length = 0.3,
				Goal = {Position = UDim2.new(0, 0, 0, 0)}
			})

			Library:Tween(Gui["18"], {
				Length = 0.3,
				Goal = {Size = UDim2.new(0, 498, 0, 452)}
			})

			Gui.Hidden = false
		end
	end
	

	
	do
		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Gui.ToggleKey then
				if not Gui.TweeningToggle then
					Gui:Toggled()
				end
			end
		end)
	end
	
	function Gui:ChangeTogglekey(key)
		Gui.ToggleKey = key
	end
	
	return Gui
end


function Library:Notify(options)
	options = Library:Place_Defaults({
		Name = "Ring Ring",
		Text = "Notification!!",
		Icon = "rbxassetid://11401835376",
		Duration = 5,
		Callback = function() return end
	}, options or {})
	
	local Notification = {}
	
	do
		-- StarterGui.Vision Lib v2.NotifFrame.Notif
		Notification["84"] = Instance.new("Frame", LibFrame["81"])
		Notification["84"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["84"]["Size"] = UDim2.new(0, 257, 0, 0)
		Notification["84"]["ClipsDescendants"] = true
		Notification["84"]["Position"] = UDim2.new(0, -41, 0, 0)
		Notification["84"]["Name"] = [[Notif]]
		Notification["84"]["ClipsDescendants"] = true
		Notification["84"]["BorderSizePixel"] = 0

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.UICorner
		Notification["85"] = Instance.new("UICorner", Notification["84"])
		Notification["85"]["CornerRadius"] = UDim.new(0, 4)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.ImageLabel
		Notification["86"] = Instance.new("ImageLabel", Notification["84"])
		Notification["86"]["BorderSizePixel"] = 0
		Notification["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["86"]["Image"] = options.Icon
		Notification["86"]["Size"] = UDim2.new(0, 18, 0, 16)
		Notification["86"]["BackgroundTransparency"] = 1
		Notification["86"]["Position"] = UDim2.new(0, 10, 0, 5)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.ImageLabel.ThemeColorGradient
		Notification["87"] = Instance.new("UIGradient", Notification["86"])
		Notification["87"]["Name"] = [[ThemeColorGradient]]
		Notification["87"]["Rotation"] = 90
		Notification["87"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(132, 65, 232)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(105, 52, 185))}

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.NotifName
		Notification["88"] = Instance.new("TextLabel", Notification["84"])
		Notification["88"]["BorderSizePixel"] = 0
		Notification["88"]["TextXAlignment"] = Enum.TextXAlignment.Left
		Notification["88"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["88"]["TextSize"] = 12
		Notification["88"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["88"]["Size"] = UDim2.new(0, 206, 0, 21)
		Notification["88"]["Text"] = options.Name
		Notification["88"]["Name"] = [[NotifName]]
		Notification["88"]["Font"] = Enum.Font.GothamMedium
		Notification["88"]["BackgroundTransparency"] = 1
		Notification["88"]["Position"] = UDim2.new(0, 34, 0, 3)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.NotifName.ThemeColorGradient
		Notification["89"] = Instance.new("UIGradient", Notification["88"])
		Notification["89"]["Name"] = [[ThemeColorGradient]]
		Notification["89"]["Rotation"] = 90
		Notification["89"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(132, 65, 232)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(105, 52, 185))}

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.NotifText
		Notification["8a"] = Instance.new("TextLabel", Notification["84"])
		Notification["8a"]["TextWrapped"] = true
		Notification["8a"]["BorderSizePixel"] = 0
		Notification["8a"]["TextXAlignment"] = Enum.TextXAlignment.Left
		Notification["8a"]["TextYAlignment"] = Enum.TextYAlignment.Top
		Notification["8a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["8a"]["TextSize"] = 10
		Notification["8a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["8a"]["Size"] = UDim2.new(0, 242, 0, 28)
		Notification["8a"]["Text"] = options.Text
		Notification["8a"]["Name"] = [[NotifText]]
		Notification["8a"]["Font"] = Enum.Font.GothamMedium
		Notification["8a"]["BackgroundTransparency"] = 1
		Notification["8a"]["Position"] = UDim2.new(0, 10, 0, 23)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.TimeBarBack
		Notification["8b"] = Instance.new("Frame", Notification["84"])
		Notification["8b"]["BorderSizePixel"] = 0
		Notification["8b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["8b"]["Size"] = UDim2.new(0, 239, 0, 5)
		Notification["8b"]["Position"] = UDim2.new(0.03501945361495018, 0, 0.7903226017951965, 0)
		Notification["8b"]["Name"] = [[TimeBarBack]]

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.TimeBarBack.Frame
		Notification["8c"] = Instance.new("Frame", Notification["8b"])
		Notification["8c"]["BorderSizePixel"] = 0
		Notification["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["8c"]["Size"] = UDim2.new(0.5, 0, 1, 0)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.TimeBarBack.Frame.ThemeColorGradient
		Notification["8d"] = Instance.new("UIGradient", Notification["8c"])
		Notification["8d"]["Name"] = [[ThemeColorGradient]]
		Notification["8d"]["Rotation"] = 90
		Notification["8d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(132, 65, 232)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(105, 52, 185))}

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.TimeBarBack.UIGradient
		Notification["8e"] = Instance.new("UIGradient", Notification["8b"])
		Notification["8e"]["Rotation"] = 270
		Notification["8e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 40, 40)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(45, 45, 45))}

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.UIGradient
		Notification["8f"] = Instance.new("UIGradient", Notification["84"])
		Notification["8f"]["Rotation"] = 90
		Notification["8f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(32, 32, 32)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(25, 25, 25))}
	end
	
	do
		task.spawn(function()
			repeat task.wait() until Library.Loaded
			
			local Completed = false

			Library:Tween(Notification["84"], {
				Length = 0.5,
				Goal = {Size = UDim2.new(0, 257, 0, 62)}
			})

			Library:Tween(Notification["8c"], {
				Length = options.Duration,
				Style = Enum.EasingStyle.Linear,
				Goal = {Size = UDim2.new(1, 0, 1, 0)}
			}, function()
				Completed = true
			end)

			repeat task.wait() until Completed
			
			local Completed = false
			
			Library:Tween(Notification["84"], {
				Length = 0.5,
				Goal = {Size = UDim2.new(0, 257, 0, 0)}
			}, function()
				Completed = true
			end)
			
			repeat task.wait() until Completed
			
			options.Callback()
			Notification["84"]:Destroy()
		end)
	end
end

function Library:ForceNotify(options)
	options = Library:Place_Defaults({
		Name = "Ring Ring",
		Text = "Notification!!",
		Icon = "rbxassetid://11401835376",
		Duration = 5,
		Callback = function() return end
	}, options or {})

	local Notification = {}

	do
		-- StarterGui.Vision Lib v2.NotifFrame.Notif
		Notification["84"] = Instance.new("Frame", LibFrame["81"])
		Notification["84"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["84"]["Size"] = UDim2.new(0, 257, 0, 0)
		Notification["84"]["ClipsDescendants"] = true
		Notification["84"]["Position"] = UDim2.new(0, -41, 0, 0)
		Notification["84"]["Name"] = [[Notif]]
		Notification["84"]["ClipsDescendants"] = true
		Notification["84"]["BorderSizePixel"] = 0

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.UICorner
		Notification["85"] = Instance.new("UICorner", Notification["84"])
		Notification["85"]["CornerRadius"] = UDim.new(0, 4)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.ImageLabel
		Notification["86"] = Instance.new("ImageLabel", Notification["84"])
		Notification["86"]["BorderSizePixel"] = 0
		Notification["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["86"]["Image"] = options.Icon
		Notification["86"]["Size"] = UDim2.new(0, 18, 0, 16)
		Notification["86"]["BackgroundTransparency"] = 1
		Notification["86"]["Position"] = UDim2.new(0, 10, 0, 5)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.ImageLabel.ThemeColorGradient
		Notification["87"] = Instance.new("UIGradient", Notification["86"])
		Notification["87"]["Name"] = [[ThemeColorGradient]]
		Notification["87"]["Rotation"] = 90
		Notification["87"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(132, 65, 232)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(105, 52, 185))}

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.NotifName
		Notification["88"] = Instance.new("TextLabel", Notification["84"])
		Notification["88"]["BorderSizePixel"] = 0
		Notification["88"]["TextXAlignment"] = Enum.TextXAlignment.Left
		Notification["88"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["88"]["TextSize"] = 12
		Notification["88"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["88"]["Size"] = UDim2.new(0, 206, 0, 21)
		Notification["88"]["Text"] = options.Name
		Notification["88"]["Name"] = [[NotifName]]
		Notification["88"]["Font"] = Enum.Font.GothamMedium
		Notification["88"]["BackgroundTransparency"] = 1
		Notification["88"]["Position"] = UDim2.new(0, 34, 0, 3)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.NotifName.ThemeColorGradient
		Notification["89"] = Instance.new("UIGradient", Notification["88"])
		Notification["89"]["Name"] = [[ThemeColorGradient]]
		Notification["89"]["Rotation"] = 90
		Notification["89"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(132, 65, 232)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(105, 52, 185))}

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.NotifText
		Notification["8a"] = Instance.new("TextLabel", Notification["84"])
		Notification["8a"]["TextWrapped"] = true
		Notification["8a"]["BorderSizePixel"] = 0
		Notification["8a"]["TextXAlignment"] = Enum.TextXAlignment.Left
		Notification["8a"]["TextYAlignment"] = Enum.TextYAlignment.Top
		Notification["8a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["8a"]["TextSize"] = 10
		Notification["8a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["8a"]["Size"] = UDim2.new(0, 242, 0, 28)
		Notification["8a"]["Text"] = options.Text
		Notification["8a"]["Name"] = [[NotifText]]
		Notification["8a"]["Font"] = Enum.Font.GothamMedium
		Notification["8a"]["BackgroundTransparency"] = 1
		Notification["8a"]["Position"] = UDim2.new(0, 10, 0, 23)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.TimeBarBack
		Notification["8b"] = Instance.new("Frame", Notification["84"])
		Notification["8b"]["BorderSizePixel"] = 0
		Notification["8b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["8b"]["Size"] = UDim2.new(0, 239, 0, 5)
		Notification["8b"]["Position"] = UDim2.new(0.03501945361495018, 0, 0.7903226017951965, 0)
		Notification["8b"]["Name"] = [[TimeBarBack]]

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.TimeBarBack.Frame
		Notification["8c"] = Instance.new("Frame", Notification["8b"])
		Notification["8c"]["BorderSizePixel"] = 0
		Notification["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		Notification["8c"]["Size"] = UDim2.new(0.5, 0, 1, 0)

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.TimeBarBack.Frame.ThemeColorGradient
		Notification["8d"] = Instance.new("UIGradient", Notification["8c"])
		Notification["8d"]["Name"] = [[ThemeColorGradient]]
		Notification["8d"]["Rotation"] = 90
		Notification["8d"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(132, 65, 232)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(105, 52, 185))}

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.TimeBarBack.UIGradient
		Notification["8e"] = Instance.new("UIGradient", Notification["8b"])
		Notification["8e"]["Rotation"] = 270
		Notification["8e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 40, 40)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(45, 45, 45))}

		-- StarterGui.Vision Lib v2.NotifFrame.Notif.UIGradient
		Notification["8f"] = Instance.new("UIGradient", Notification["84"])
		Notification["8f"]["Rotation"] = 90
		Notification["8f"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(32, 32, 32)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(25, 25, 25))}
	end

	do
		task.spawn(function()
			local Completed = false

			Library:Tween(Notification["84"], {
				Length = 0.5,
				Goal = {Size = UDim2.new(0, 257, 0, 62)}
			})

			Library:Tween(Notification["8c"], {
				Length = options.Duration,
				Style = Enum.EasingStyle.Linear,
				Goal = {Size = UDim2.new(1, 0, 1, 0)}
			}, function()
				Completed = true
			end)

			repeat task.wait() until Completed

			local Completed = false

			Library:Tween(Notification["84"], {
				Length = 0.5,
				Goal = {Size = UDim2.new(0, 257, 0, 0)}
			}, function()
				Completed = true
			end)

			repeat task.wait() until Completed

			options.Callback()
			Notification["84"]:Destroy()
		end)
	end
end

function Library:Destroy()
	LibFrame["1"]:Destroy()
end

return Library
