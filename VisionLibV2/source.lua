-- Services
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
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
		Length = 1,
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
		Length = 1,
		Goal = {Size = UDim2.new(0, 458, 0, ContainerSize)}
	})
	
	Library:Tween(Section, {
		Length = 1,
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
		ToggleKey = Enum.KeyCode.RightShift
	}, options or {})
	
	local Gui = {
		CurrentTab = nil,
		CurrentTabIndex = 0,
		TweeningToggle = false,
		ToggleKey = options.ToggleKey,
		Hidden = false
	}
	
	local StartAnimation = {}
	
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
		StartAnimation["9e"]["Text"] = [[Welcome, Loco_CTO]]
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
					OldVal = options.Default
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
					Slider["3a"]["Size"] = UDim2.new(0, 136, 0, 18)
					Slider["3a"]["Position"] = UDim2.new(0, 229, 0, 6)
					Slider["3a"]["Name"] = [[Slider]]

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Slider.UICorner
					Slider["3b"] = Instance.new("UICorner", Slider["3a"])
					Slider["3b"]["CornerRadius"] = UDim.new(1, 0)

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Slider.Sliderbackground
					Slider["3c"] = Instance.new("Frame", Slider["3a"])
					Slider["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
					Slider["3c"]["Size"] = UDim2.new(0.49264705181121826, 0, 0.9444444179534912, 0)
					Slider["3c"]["Name"] = [[Sliderbackground]]
					Slider["3c"]["BorderSizePixel"] = 0

					-- StarterGui.Vision Lib v2.GuiFrame.MainFrame.Container.SectionFrame.SectionContainer.Slider.Slider.Sliderbackground.UICorner
					Slider["3d"] = Instance.new("UICorner", Slider["3c"])
					Slider["3d"]["CornerRadius"] = UDim.new(1, 0)

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
						Library:Tween(Slider["40"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(65, 65, 65)}
						})
					end)
					
					Slider["36"].MouseLeave:Connect(function()
						Library:Tween(Slider["40"], {
							Length = 0.5,
							Goal = {Color = Color3.fromRGB(43, 43, 43)}
						})
					end)
					
					Slider["3a"].MouseEnter:Connect(function()
						Slider.Hover = true
					end)

					Slider["3a"].MouseLeave:Connect(function()
						Slider.Hover = false
					end)

					Slider["3g"].Focused:Connect(function()
						Slider["3g"]["Text"] = [[]]
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
					end)

					UserInputService.InputBegan:connect(function(key)
						if key.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
							Library.Sliding = true
							MouseDown = true

							while RunService.RenderStepped:wait() and MouseDown do
								local percentage = math.clamp((Mouse.X - Slider["3a"].AbsolutePosition.X) / (Slider["3a"].AbsoluteSize.X), 0, 1)
								local value = ((options.Max - options.Min) * percentage) + options.Min
								value = math.floor(value)
								if value ~= Slider.OldVal then
									options.Callback(value)
								end
								Slider.OldVal = value
								Slider["3g"]["Text"] = value
								Library:Tween(Slider["3c"], {
									Length = 0.06,
									Goal = {Size = UDim2.fromScale(percentage, 1)}
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
	do
		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Gui.ToggleKey then
				if not Gui.TweeningToggle then
					Gui.TweeningToggle = true

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

					Gui.TweeningToggle = false
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

return Library