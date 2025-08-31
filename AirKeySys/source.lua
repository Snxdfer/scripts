-- By 00Fazee 31/08/2025
-- Air Key System v1.1 (Fixed)

function fontFix(fontData)
	return Font.new(fontData.Family, fontData.Weight, fontData.Style)
end

function createObject(className, properties)
	local instance = Instance.new(className)
	local parent
	for property, value in pairs(properties) do
		if property ~= "Parent" then
			instance[property] = value
		else
			parent = value
		end
	end
	instance.Parent = parent
	return instance
end

function WhitelistCreate(titleText, descriptionText, linkValue)
	local oldGui = game.CoreGui:FindFirstChild("Rnd") and game.CoreGui:FindFirstChild("Rnd"):Destroy()
	local screenGui = createObject("ScreenGui", {
		Name = "Rnd",
		Parent = game.CoreGui,
	})

	local mainFrame = createObject("Frame", {
		Parent = screenGui,
		ClipsDescendants = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 0, 0),
	})
	createObject("UICorner", { Parent = mainFrame })
	createObject("UIStroke", {
		Parent = mainFrame,
		Thickness = 3.8,
		Transparency = 0.9,
	})

	local titleLabel = createObject("TextLabel", {
		Parent = mainFrame,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.064, 0, 0.083, 0),
		Size = UDim2.new(0, 187, 0, 18),
		Font = Enum.Font.Gotham,
		FontFace = fontFix{
			Family = "rbxasset://fonts/families/GothamSSm.json",
			Weight = Enum.FontWeight.Regular,
			Style = Enum.FontStyle.Normal
		},
		Text = titleText or "Air Key",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local descriptionLabel = createObject("TextLabel", {
		Parent = mainFrame,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.064, 0, 0.162, 0),
		Size = UDim2.new(0, 270, 0, 11),
		Font = Enum.Font.Gotham,
		FontFace = fontFix{
			Family = "rbxasset://fonts/families/GothamSSm.json",
			Weight = Enum.FontWeight.Regular,
			Style = Enum.FontStyle.Normal
		},
		Text = descriptionText or "A simple key system using work.ink",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 10,
		TextTransparency = 0.47,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	createObject("Decal", {
		Name = "White Gradient",
		Parent = descriptionLabel,
		Texture = "http://www.roblox.com/asset/?id=277037193",
	})

	local backgroundImage = createObject("ImageLabel", {
		Parent = mainFrame,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0.432, 0),
		Size = UDim2.new(0, 326, 0, 130),
		Image = "http://www.roblox.com/asset/?id=277037193",
		ImageTransparency = 0.93,
	})
	createObject("UICorner", { Parent = backgroundImage })

	local loginButton = createObject("TextButton", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(91, 161, 78),
		Position = UDim2.new(0.064, 0, 0.401, 0),
		Size = UDim2.new(0, 63, 0, 21),
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		FontFace = fontFix{
			Family = "rbxasset://fonts/families/GothamSSm.json",
			Weight = Enum.FontWeight.Regular,
			Style = Enum.FontStyle.Normal
		},
		Text = "LOGIN",
		TextColor3 = Color3.fromRGB(255, 255, 255),
	})
	createObject("UIStroke", {
		Parent = loginButton,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(115, 238, 101),
		LineJoinMode = Enum.LineJoinMode.Miter,
		Thickness = 0.7,
	})

	local keyBox = createObject("TextBox", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(61, 61, 61),
		Position = UDim2.new(0.064, 0, 0.266, 0),
		Size = UDim2.new(0, 235, 0, 21),
		Font = Enum.Font.SourceSans,
		FontFace = fontFix{
			Family = "rbxasset://fonts/families/SourceSansPro.json",
			Weight = Enum.FontWeight.Regular,
			Style = Enum.FontStyle.Normal
		},
		PlaceholderText = "Enter Key or Code provided by work.ink",
		Text = "",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	createObject("UIStroke", {
		Parent = keyBox,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(99, 99, 99),
		LineJoinMode = Enum.LineJoinMode.Miter,
		Thickness = 0.7,
	})
	createObject("UIPadding", {
		Parent = keyBox,
		PaddingLeft = UDim.new(0, 9),
	})

	local cancelButton = createObject("TextButton", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(153, 88, 88),
		Position = UDim2.new(0.064, 0, 0.834, 0),
		Size = UDim2.new(0, 63, 0, 21),
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		FontFace = fontFix{
			Family = "rbxasset://fonts/families/GothamSSm.json",
			Weight = Enum.FontWeight.Regular,
			Style = Enum.FontStyle.Normal
		},
		Text = "CANCEL",
		TextColor3 = Color3.fromRGB(255, 255, 255),
	})
	createObject("UIStroke", {
		Parent = cancelButton,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(255, 151, 151),
		LineJoinMode = Enum.LineJoinMode.Miter,
		Thickness = 0.7,
	})

	local function tweenObject(object, easingStyle, time, easingDirection, properties)
		game.TweenService:Create(object, TweenInfo.new(time, easingStyle, easingDirection), properties):Play()
	end

	local httpRequest = (syn and syn.request) or (http and http.request) or http_request
	local function getRequest(url)
		return httpRequest({
			Url = url,
			Method = "GET",
			Headers = { ["Content-Type"] = "application/json" },
		}).Body
	end

	local function validateKey(key)
		key = key .. "W"
		key = tostring(key):sub(1, 36)
		local response = game.HttpService:JSONDecode(getRequest("https://redirect-api.work.ink/tokenValid/" .. key))
		return response.valid
	end

	local function playSound(soundId)
		local sound = Instance.new("Sound")
		sound.Parent = game.SoundService
		sound.SoundId = "rbxassetid://" .. soundId
		sound.PlayOnRemove = true
		sound:Destroy()
	end

	local function closeGui()
		tweenObject(mainFrame, Enum.EasingStyle.Circular, 0.3, Enum.EasingDirection.Out, {
			Size = UDim2.new(0, 0, 0, 0)
		})
		wait(0.3)
		screenGui:Destroy()
	end

	tweenObject(mainFrame, Enum.EasingStyle.Circular, 0.3, Enum.EasingDirection.Out, {
		Size = UDim2.new(0, 326, 0, 229)
	})
	playSound(8379220604)

	loginButton.MouseButton1Down:Connect(function()
		playSound(7433801607)
		wait(0.2)
		if keyBox.Text:len() == 36 and validateKey(keyBox.Text) then
			Whitelisted = true
			playSound(3422389728)
			wait(0.2)
			closeGui()
		else
			playSound(654933750)
		end
	end)

	cancelButton.MouseButton1Down:Connect(function()
		playSound(1524543584)
		closeGui()
	end)
end

return WhitelistCreate
