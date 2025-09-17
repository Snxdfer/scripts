local UIManager = {}

local function hasKey(tableObj, key)
	return tableObj[key] ~= nil
end

local function timeAgo(seconds)
	local years = math.floor(seconds / 31104000)
	local remainder = seconds % 31104000
	local months = math.floor(remainder / 2592000)
	remainder = remainder % 2592000
	local weeks = math.floor(remainder / 604800)
	remainder = remainder % 604800
	local days = math.floor(remainder / 86400)
	remainder = remainder % 86400
	local hours = math.floor(remainder / 3600)
	remainder = remainder % 3600
	local minutes = math.floor(remainder / 60)
	remainder = remainder % 60
	local secs = remainder

	if years ~= 0 then
		return years .. ' year' .. (years > 1 and 's' or '') .. ' ago'
	elseif months ~= 0 then
		return months .. ' month' .. (months > 1 and 's' or '') .. ' ago'
	elseif weeks ~= 0 then
		return weeks .. ' week' .. (week > 1 and 's' or '') .. ' ago'
	elseif hours ~= 0 then
		return hours .. ' hour' .. (hours > 1 and 's' or '') .. ' ago'
	elseif minutes ~= 0 then
		return minutes .. ' minute' .. (minutes > 1 and 's' or '') .. ' ago'
	elseif secs ~= 0 then
		return secs .. ' second' .. (secs > 1 and 's' or '') .. ' ago'
	elseif days ~= 0 then
		return days .. ' day' .. (days > 1 and 's' or '') .. ' ago'
	end
end

local function tween(object, duration, properties)
	game.TweenService:Create(object, TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), properties):Play()
end

function createObject(className, properties)
	local newInstance = Instance.new(className)
	local parent
	for property, value in pairs(properties) do
		if property ~= "Parent" then
			newInstance[property] = value
		else
			parent = value
		end
	end
	newInstance.Parent = parent
	return newInstance
end


local screenGui = createObject("ScreenGui", {
	Name = "Core",
	Parent = game.CoreGui,
})
function UIManager:CreateWindow(title, callback)
	local window = {
		Created = 0,
		Selection = nil
	}

	local mainFrame = createObject("Frame", {
		Name = "Main",
		Parent = screenGui,
		ClipsDescendants = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(7, 7, 7),
		BorderColor3 = Color3.fromRGB(53, 53, 53),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 0, 0),
	})
	local shadeFrame = createObject("Frame", {
		Name = "Shade",
		Parent = mainFrame,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(7, 7, 7),
		BorderColor3 = Color3.fromRGB(53, 53, 53),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5824999809265137, 0),
		Size = UDim2.new(0, 624, 0, 390),
		ZIndex = 10,
	})
	local loadingBar = createObject("Frame", {
		Name = "LDBG",
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
		Position = UDim2.new(0.322, 0, 0.26315799355506897, 0),
		Size = UDim2.new(0, 388, 0, 35),
	})
	local loadingBarCorner = createObject("UICorner", {
		Name = "UICorner69",
		Parent = loadingBar,
		CornerRadius = UDim.new(0, 6),
	})
	local splashFrame = createObject("Frame", {
		Name = "SPLASH",
		Parent = loadingBar,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(170, 170, 170),
		Size = UDim2.new(0, 0, 0, 35),
	})
	local splashCorner = createObject("UICorner", {
		Name = "UICorner70",
		Parent = splashFrame,
		CornerRadius = UDim.new(0, 6),
	})
	local splashGradient = createObject("UIGradient", {
		Parent = splashFrame,
		Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 180, 213)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 227, 122))
		},
	})
	local mainCorner = createObject("UICorner", {
		Parent = mainFrame,
		CornerRadius = UDim.new(0, 6),
	})
	local cloudButton = createObject("ImageButton", {
		Name = "Cloud",
		Parent = mainFrame,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.093952976167202, 0, 0.09986995160579681, 0),
		Size = UDim2.new(0, 35, 0, 35),
		ZIndex = 2,
		Image = "rbxassetid://3926305904",
		ImageRectOffset = Vector2.new(324, 764),
		ImageRectSize = Vector2.new(36, 36),
	})
	local cloudGradient = createObject("UIGradient", {
		Parent = cloudButton,
		Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 180, 213)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 227, 122))
		},
	})
	local titleLabel = createObject("TextLabel", {
		Name = "Title",
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.1465577334165573, 0, 0.062476783990859985, 0),
		Size = UDim2.new(0, 193, 0, 35),
		Font = Enum.Font.Gotham,
		RichText = true,
		Text = "<b>" .. title .. "</b>",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	local contentFrame = createObject("Frame", {
		Name = "Content",
		Parent = mainFrame,
		Visible = false,
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.16500000655651093, 0),
		Size = UDim2.new(0, 547, 0, 345),
		Transparency = 1,
	})
	local selectGameFrame = createObject("Frame", {
		Name = "SelectGame",
		Parent = contentFrame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0.08405797183513641, 0),
		Size = UDim2.new(0.5, 0, -0.08405797183513641, 345),
		Transparency = 1,
	})
	local selectGameListLayout = createObject("UIListLayout", {
		Parent = selectGameFrame,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10),
	})

	local selectGamePadding = createObject("UIPadding", {
		Parent = selectGameFrame,
		PaddingLeft = UDim.new(0, 5),
		PaddingRight = UDim.new(0, 5),
	})
	local detailsFrame = createObject("Frame", {
		Name = "Details",
		Parent = contentFrame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0, 0),
		Size = UDim2.new(0.5, 0, 0, 345),
		Transparency = 1,
	})
	local detailsListLayout = createObject("UIListLayout", {
		Parent = detailsFrame,
		Padding = UDim.new(0, 10),
	})
	local detailsPadding = createObject("UIPadding", {
		Parent = detailsFrame,
		PaddingLeft = UDim.new(0, 5),
		PaddingRight = UDim.new(0, 5),
	})
	local artworkButton = createObject("ImageButton", {
		Name = "AImage",
		Parent = detailsFrame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Size = UDim2.new(1, 0, 0.0811847597360611, 100),
		Image = "http://www.roblox.com/asset/?id=8899558070",
	})
	local artworkCorner = createObject("UICorner", {
		Parent = artworkButton,
		CornerRadius = UDim.new(0, 7),
	})
	local artworkOverlay = createObject("Frame", {
		Parent = artworkButton,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.3499999940395355,
		Size = UDim2.new(1, 0, 1, 0),
		Transparency = 0.3499999940395355,
	})
	local overlayCorner = createObject("UICorner", {
		Parent = artworkOverlay,
		CornerRadius = UDim.new(0, 7),
	})
	local overlayGradient = createObject("UIGradient", {
		Parent = artworkOverlay,
		Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 180, 213)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 227, 122))
		},
	})
	local artworkTextLabel = createObject("TextLabel", {
		Parent = artworkButton,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.0759013295173645, 0, 0.7128929495811462, 0),
		Size = UDim2.new(0, 200, 0, 29),
		Font = Enum.Font.Gotham,
		RichText = true,
		Text = "<b></b>",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	local loadButton = createObject("TextButton", {
		Name = "YLoad",
		Parent = detailsFrame,
		BackgroundColor3 = Color3.fromRGB(118, 118, 118),
		Position = UDim2.new(0, 0, 0.6724890470504761, 0),
		Size = UDim2.new(1, 0, -0.02028985507786274, 50),
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		RichText = true,
		Text = "",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 9,
	})
	local loadButtonCorner = createObject("UICorner", {
		Parent = loadButton,
		CornerRadius = UDim.new(0, 4),
	})
	local loadButtonPadding = createObject("UIPadding", {
		Parent = loadButton,
	})
	local loadButtonGradient = createObject("UIGradient", {
		Parent = loadButton,
		Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 180, 213)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 227, 122))
		},
	})
	local playImage = createObject("ImageButton", {
		Name = "Play",
		Parent = loadButton,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.3678068518638611, 0, 0.5, 0),
		Size = UDim2.new(0, 11, 0, 11),
		Image = "rbxassetid://7671465363",
	})
	local loadLabel = createObject("TextLabel", {
		Name = "LoadLabel",
		Parent = loadButton,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, -0.09302325546741486, 0),
		Size = UDim2.new(0, 263, 0, 50),
		Font = Enum.Font.Gotham,
		Text = "LOAD",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 11,
	})
	local statusButton = createObject("TextButton", {
		Name = "TStatus",
		RichText = true,
		Parent = detailsFrame,
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		Position = UDim2.new(0, 0, 0.40002530813217163, 0),
		Size = UDim2.new(1, 0, -0.037681158632040024, 50),
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		Text = "",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	local statusCorner = createObject("UICorner", {
		Parent = statusButton,
		CornerRadius = UDim.new(0, 4),
	})
	local statusPadding = createObject("UIPadding", {
		Parent = statusButton,
		PaddingLeft = UDim.new(0, 20),
	})
	local statusGradient = createObject("UIGradient", {
		Parent = statusButton,
		Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 180, 213)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 227, 122))
		},
		Enabled = false,
	})
	local lastUpdatedButton = createObject("TextButton", {
		Name = "XLastUpdated",
		Parent = detailsFrame,
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		Position = UDim2.new(-0.10246679186820984, 0, 0.41741660237312317, 0),
		Size = UDim2.new(1, 0, -0.037681158632040024, 50),
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		RichText = true,
		Text = "Last Updated <b>5 seconds ago</b>",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	local lastUpdatedCorner = createObject("UICorner", {
		Parent = lastUpdatedButton,
		CornerRadius = UDim.new(0, 4),
	})
	local lastUpdatedPadding = createObject("UIPadding", {
		Parent = lastUpdatedButton,
		PaddingLeft = UDim.new(0, 20),
	})
	local lastUpdatedGradient = createObject("UIGradient", {
		Parent = lastUpdatedButton,
		Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 180, 213)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 227, 122))
		},
		Enabled = false,
	})
	local exitButton = createObject("TextButton", {
		Name = "ZExit",
		Parent = detailsFrame,
		BackgroundColor3 = Color3.fromRGB(118, 118, 118),
		Position = UDim2.new(0, 0, 0.6724890470504761, 0),
		Size = UDim2.new(1, 0, -0.02028985507786274, 50),
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		RichText = true,
		Text = "",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 9,
	})
	local exitCorner = createObject("UICorner", {
		Parent = exitButton,
		CornerRadius = UDim.new(0, 4),
	})
	local exitPadding = createObject("UIPadding", {
		Parent = exitButton,
	})
	local exitGradient = createObject("UIGradient", {
		Parent = exitButton,
		Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(213, 83, 83)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(227, 34, 34))
		},
	})
	local exitLabel = createObject("TextLabel", {
		Name = "ExitLabel",
		Parent = exitButton,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, -0.09302325546741486, 0),
		Size = UDim2.new(0, 263, 0, 50),
		Font = Enum.Font.Gotham,
		Text = "EXIT",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 11,
	})
	local exitImage = createObject("ImageButton", {
		Name = "X",
		Parent = exitButton,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		LayoutOrder = 5,
		Position = UDim2.new(0.3880000114440918, 0, 0.5, 0),
		Size = UDim2.new(0, 15, 0, 15),
		ZIndex = 2,
		Image = "rbxassetid://3926305904",
		ImageRectOffset = Vector2.new(924, 724),
		ImageRectSize = Vector2.new(36, 36),
	})
	local selectLabel = createObject("TextLabel", {
		Parent = contentFrame,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.034721024334430695, 0, -0.0035395524464547634, 0),
		Size = UDim2.new(0, 198, 0, 24),
		Font = Enum.Font.Gotham,
		RichText = true,
		Text = "Select a game",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	loadButton.MouseButton1Down:Connect(function()
		callback(window.Selection)
		window:Exit()
	end)
	exitButton.MouseButton1Down:Connect(function()
		window:Exit()
	end)
	
	
	function window:CreateSelection(gameData, unused)
		window.Created += 1
		local selectionButton = createObject("TextButton", {
			Name = "SelectionButton",
			Parent = selectGameFrame,
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			Size = UDim2.new(1, 0, -0.017391303554177284, 50),
			AutoButtonColor = false,
			Font = Enum.Font.Gotham,
			Text = gameData.Name or "New Selection",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
		})
		local selectionCorner = createObject("UICorner", {
			Parent = selectionButton,
			CornerRadius = UDim.new(0, 4),
		})
		local selectionPadding = createObject("UIPadding", {
			Parent = selectionButton,
			PaddingLeft = UDim.new(0, 50),
		})
		local doneAllButton = createObject("ImageButton", {
			Name = "done_all",
			Parent = selectionButton,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			LayoutOrder = 7,
			Position = UDim2.new(0.8817330002784729, 0, 0.4999999701976776, 0),
			Size = UDim2.new(0, 17, 0, 17),
			ZIndex = 2,
			Image = "rbxassetid://3926305904",
			ImageRectOffset = Vector2.new(4, 444),
			ImageRectSize = Vector2.new(36, 36),
		})
		local doneAllGradient = createObject("UIGradient", {
			Parent = doneAllButton,
			Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 180, 213)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 227, 122))
			},
		})
		local selectionGradient = createObject("UIGradient", {
			Parent = selectionButton,
			Enabled = false,
			Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 180, 213)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 227, 122))
			},
		})
		local checkedCircle = createObject("ImageButton", {
			Name = "CheckedCircle",
			ImageTransparency = 1,
			Parent = selectionButton,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			LayoutOrder = 17,
			Position = UDim2.new(-0.10421544313430786, 0, 0.5, 0),
			Size = UDim2.new(0, 25, 0, 25),
			ZIndex = 2,
			Image = "rbxassetid://3926309567",
			ImageRectOffset = Vector2.new(784, 420),
			ImageRectSize = Vector2.new(48, 48),
		})
		local circle = createObject("ImageButton", {
			Name = "Circle",
			Parent = selectionButton,
			ImageTransparency = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			LayoutOrder = 16,
			Position = UDim2.new(-0.10421544313430786, 0, 0.5, 0),
			Size = UDim2.new(0, 25, 0, 25),
			ZIndex = 2,
			Image = "rbxassetid://3926305904",
			ImageRectOffset = Vector2.new(324, 964),
			ImageRectSize = Vector2.new(36, 36),
		})
		local checkedGradient = createObject("UIGradient", {
			Parent = checkedCircle,
			Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 180, 213)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(3, 227, 122))
			},
		})
		local function selectFunc()
			for _, descendant in pairs(selectGameFrame:GetDescendants()) do
				if descendant:IsA'UIGradient' and descendant.Parent.Name ~= "done_all" then
					descendant.Enabled = false
				end
				if descendant.Name == 'CheckedCircle' then
					tween(descendant, 0.25, {
						ImageTransparency = 1
					})
				end
				if descendant.Name == 'Circle' then
					tween(descendant, 0.25, {
						ImageTransparency = 0
					})
				end
			end
			tween(circle, 0.25, {
				ImageTransparency = 1
			})
			tween(checkedCircle, 0.25, {
				ImageTransparency = 0
			})
			selectionGradient.Enabled = true
			doneAllGradient.Enabled = true
			checkedGradient.Enabled = true
			window.Selection = gameData.Flag
			statusButton.Text = "Currently <b>" .. gameData.Status .. "</b>"
			artworkTextLabel.Text = (gameData.Name or 'Game')
			artworkButton.Image = (gameData.Image or '')
			lastUpdatedButton.Text = "Last Updated <b>" .. (timeAgo(os.time() - gameData.UpdateDate) or 'Never') .. "</b>"
		end
		if window.Created == 1 then
			selectFunc()
		end
		selectionButton.MouseButton1Down:Connect(selectFunc)
		checkedCircle.MouseButton1Down:Connect(selectFunc)
		circle.MouseButton1Down:Connect(selectFunc)
		doneAllButton.MouseButton1Down:Connect(selectFunc)
        
	end
	function window:Exit()
		tween(shadeFrame, 0.25, {
			BackgroundTransparency = 0
		})
		tween(cloudButton, 0.25, {
			ImageTransparency = 1
		})
		tween(titleLabel, 0.25, {
			TextTransparency = 1
		})
		wait(0.25)
		contentFrame.Visible = false
		shadeFrame.Visible = false
		shadeFrame.BackgroundTransparency = 1
		tween(mainFrame, 0.25, {
			Size = UDim2.new(0, 624, 0, 76)
		})
		titleLabel.Position = UDim2.new(0.13533978164196014, 0, 0, 0)
		cloudButton.Position = UDim2.new(0.07472220808267593, 0, 0.49460679292678833, 0)
		tween(titleLabel, 0.25, {
			Size = UDim2.new(0, 193, 0, 76)
		})
		wait(0.25)
		tween(cloudButton, 0.25, {
			ImageTransparency = 0
		})
		tween(titleLabel, 0.25, {
			TextTransparency = 0
		})
		wait(1)
		shadeFrame.Visible = true
		tween(shadeFrame, 0.25, {
			BackgroundTransparency = 0
		})
		wait(0.25)
		tween(mainFrame, 0.25, {
			Size = UDim2.new(0, 0, 0, 0)
		})
		wait(0.25)
		screenGui:Destroy()
	end
	function window:Initiate()
		shadeFrame.Visible = true
		contentFrame.Visible = false
		tween(mainFrame, 0.25, {
			Size = UDim2.new(0, 624, 0, 76)
		})
		tween(cloudButton, 0.15, {
			Position = UDim2.new(0.07472220808267593, 0, 0.49460679292678833, 0)
		})
		tween(titleLabel, 0.25, {
			Position = UDim2.new(0.13533978164196014, 0, 0, 0)
		})
		tween(titleLabel, 0.25, {
			Size = UDim2.new(0, 193, 0, 76)
		})
		wait(0.25)
		tween(shadeFrame, 0.25, {
			BackgroundTransparency = 1
		})
		wait(1)
		game:GetService('ContentProvider'):PreloadAsync({
			screenGui
		})
		repeat
			wait()
		until game:GetService('ContentProvider').RequestQueueSize <= 0
		tween(splashFrame, 0.5, {
			Size =  UDim2.new(1, 0, 0, 35)
		})
		wait(0.4)
		tween(splashFrame, 0.25, {
			BackgroundTransparency = 1
		})
		tween(loadingBar, 0.25, {
			BackgroundTransparency = 1
		})
		tween(cloudButton, 0.15, {
			Position = UDim2.new(0.093952976167202, 0, 0.09986995160579681, 0)
		})
		tween(titleLabel, 0.25, {
			Position = UDim2.new(0.1465577334165573, 0, 0.062476783990859985, 0)
		})
		tween(titleLabel, 0.25, {
			Size = UDim2.new(0, 193, 0, 35)
		})
		tween(mainFrame, 0.25, {
			Size = UDim2.new(0, 624, 0, 468)
		})
		wait(0.25)
		shadeFrame.BackgroundTransparency = 0
		contentFrame.Visible = true
		tween(shadeFrame, 0.25, {
			BackgroundTransparency = 1
		})
	end
	return window
end
return UIManager
