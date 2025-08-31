-- By 00Fazee 31/08/2025
-- Air Key System v1.0 (Fixed)

local function fontFix(data)
	return Font.new(data.Family, data.Weight, data.Style)
end

local function createObject(class, props)
	local obj = Instance.new(class)
	local parent
	for k, v in pairs(props) do
		if k ~= "Parent" then
			obj[k] = v
		else
			parent = v
		end
	end
	if parent then
		obj.Parent = parent
	end
	return obj
end

function WhitelistCreate(title, subtitle, link)
	local old = game.CoreGui:FindFirstChild("Rnd")
	if old then old:Destroy() end

	local gui = createObject("ScreenGui", { Name = "Rnd", Parent = game.CoreGui })

	local mainFrame = createObject("Frame", {
		Parent = gui,
		ClipsDescendants = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(27, 27, 27),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 0, 0),
	})
	createObject("UICorner", { Parent = mainFrame })
	createObject("UIStroke", { Parent = mainFrame, Thickness = 3.8, Transparency = 0.9 })

	createObject("TextLabel", {
		Parent = mainFrame,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.064, 0, 0.083, 0),
		Size = UDim2.new(0, 187, 0, 18),
		Font = Enum.Font.Gotham,
		FontFace = fontFix{ Family = "rbxasset://fonts/families/GothamSSm.json", Weight = Enum.FontWeight.Regular, Style = Enum.FontStyle.Normal },
		Text = title or "Air Key",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local subLabel = createObject("TextLabel", {
		Parent = mainFrame,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.064, 0, 0.162, 0),
		Size = UDim2.new(0, 270, 0, 11),
		Font = Enum.Font.Gotham,
		FontFace = fontFix{ Family = "rbxasset://fonts/families/GothamSSm.json", Weight = Enum.FontWeight.Regular, Style = Enum.FontStyle.Normal },
		Text = subtitle or "A simple key system using work.ink",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 10,
		TextTransparency = 0.47,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	createObject("Decal", {
		Name = "White Gradient",
		Parent = subLabel,
		Texture = "http://www.roblox.com/asset/?id=277037193",
	})

	local bgImage = createObject("ImageLabel", {
		Parent = mainFrame,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0.432, 0),
		Size = UDim2.new(0, 326, 0, 130),
		Image = "http://www.roblox.com/asset/?id=277037193",
		ImageTransparency = 0.93,
	})
	createObject("UICorner", { Parent = bgImage })

	local inputBox = createObject("TextBox", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(61, 61, 61),
		BorderSizePixel = 0,
		Position = UDim2.new(0.064, 0, 0.266, 0),
		Size = UDim2.new(0, 235, 0, 21),
		Font = Enum.Font.SourceSans,
		FontFace = fontFix{ Family = "rbxasset://fonts/families/SourceSansPro.json", Weight = Enum.FontWeight.Regular, Style = Enum.FontStyle.Normal },
		PlaceholderText = "Enter Key or Code provided by work.ink",
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	createObject("UIStroke", { Parent = inputBox, Color = Color3.fromRGB(99, 99, 99), Thickness = 0.7 })
	createObject("UIPadding", { Parent = inputBox, PaddingLeft = UDim.new(0, 9) })

	local loginBtn = createObject("TextButton", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(91, 161, 78),
		Position = UDim2.new(0.064, 0, 0.401, 0),
		Size = UDim2.new(0, 63, 0, 21),
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		Text = "LOGIN",
		TextColor3 = Color3.new(1, 1, 1),
	})
	createObject("UIStroke", { Parent = loginBtn, Color = Color3.fromRGB(115, 238, 101), Thickness = 0.7 })
	createObject("UIPadding", { Parent = loginBtn, PaddingRight = UDim.new(0, 10) })
	createObject("ImageButton", {
		Name = "adjust",
		Parent = loginBtn,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.936, 0, 0.5, 0),
		Size = UDim2.new(0, 10, 0, 10),
		ZIndex = 2,
		Image = "rbxassetid://3926307971",
		ImageRectOffset = Vector2.new(444, 324),
		ImageRectSize = Vector2.new(36, 36),
	})

	local linkBtn = createObject("TextButton", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(83, 145, 162),
		Position = UDim2.new(0.294, 0, 0.401, 0),
		Size = UDim2.new(0, 84, 0, 21),
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		Text = "GET LINK",
		TextColor3 = Color3.new(1, 1, 1),
	})
	createObject("UIStroke", { Parent = linkBtn, Color = Color3.fromRGB(124, 221, 243), Thickness = 0.7, Transparency = 0.1 })
	createObject("UIPadding", { Parent = linkBtn, PaddingRight = UDim.new(0, 15) })
	createObject("ImageButton", {
		Name = "link",
		Parent = linkBtn,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.915, 0, 0.5, 0),
		Size = UDim2.new(0, 10, 0, 10),
		ZIndex = 2,
		Image = "rbxassetid://3926305904",
		ImageRectOffset = Vector2.new(164, 404),
		ImageRectSize = Vector2.new(36, 36),
	})

	createObject("ImageButton", {
		Name = "lock",
		Parent = mainFrame,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.613, 0, 0.443, 0),
		Size = UDim2.new(0, 11, 0, 11),
		ZIndex = 2,
		Image = "rbxassetid://3926305904",
		ImageRectOffset = Vector2.new(4, 684),
		ImageRectSize = Vector2.new(36, 36),
		ImageTransparency = 0.66,
	})

	local cancelBtn = createObject("TextButton", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(153, 88, 88),
		Position = UDim2.new(0.064, 0, 0.834, 0),
		Size = UDim2.new(0, 63, 0, 21),
		AutoButtonColor = false,
		Font = Enum.Font.Gotham,
		Text = "CANCEL",
		TextColor3 = Color3.new(1, 1, 1),
	})
	createObject("UIStroke", { Parent = cancelBtn, Color = Color3.fromRGB(255, 151, 151), Thickness = 0.7 })
	createObject("UIPadding", { Parent = cancelBtn, PaddingRight = UDim.new(0, 10) })
	createObject("ImageButton", {
		Name = "close",
		Parent = cancelBtn,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.936, 0, 0.5, 0),
		Size = UDim2.new(0, 10, 0, 10),
		ZIndex = 2,
		Image = "rbxassetid://3926305904",
		ImageRectOffset = Vector2.new(284, 4),
		ImageRectSize = Vector2.new(24, 24),
	})

	local function tween(obj, style, time, direction, props)
		game.TweenService:Create(obj, TweenInfo.new(time, style, direction), props):Play()
	end

	local function playSound(id)
		local sound = Instance.new("Sound")
		sound.Parent = game.SoundService
		sound.SoundId = "rbxassetid://" .. id
		sound.PlayOnRemove = true
		sound:Destroy()
	end

	local function closeGui()
		tween(mainFrame, Enum.EasingStyle.Circular, 0.3, Enum.EasingDirection.Out, { Size = UDim2.new(0, 0, 0, 0) })
		task.wait(0.3)
		gui:Destroy()
	end

	local function shakeFrame()
		local originalPos = mainFrame.Position
		tween(mainFrame, Enum.EasingStyle.Elastic, 0.4, Enum.EasingDirection.InOut, { Position = UDim2.new(0.415, 0, 0.5, 0) })
		tween(mainFrame, Enum.EasingStyle.Circular, 0.3, Enum.EasingDirection.Out, { Size = UDim2.new(0, 316, 0, 209) })
		task.wait(0.1)
		tween(mainFrame, Enum.EasingStyle.Elastic, 0.4, Enum.EasingDirection.InOut, { Position = UDim2.new(0.59, 0, 0.5, 0) })
		task.wait(0.1)
		tween(mainFrame, Enum.EasingStyle.Circular, 0.3, Enum.EasingDirection.Out, { Size = UDim2.new(0, 326, 0, 229) })
		tween(mainFrame, Enum.EasingStyle.Circular, 0.2, Enum.EasingDirection.Out, { Position = originalPos })
	end

	local Whitelisted = false
	local httpRequest = (syn and syn.request) or (http and http.request) or http_request

	local function checkKey(key)
		key = tostring(key) .. "W"
		key = key:sub(1, 36)
		local response = httpRequest({
			Url = "https://redirect-api.work.ink/tokenValid/" .. key,
			Method = "GET",
			Headers = { ["Content-Type"] = "application/json" }
		})
		local data = game.HttpService:JSONDecode(response.Body)
		return data.valid
	end

	tween(mainFrame, Enum.EasingStyle.Circular, 0.3, Enum.EasingDirection.Out, { Size = UDim2.new(0, 326, 0, 229) })
	playSound(8379220604)

	loginBtn.MouseButton1Click:Connect(function()
		playSound(7433801607)
		if inputBox.Text:len() == 36 and checkKey(inputBox.Text) then
			Whitelisted = true
			playSound(3422389728)
			task.wait(0.2)
			closeGui()
		else
			playSound(654933750)
			shakeFrame()
		end
	end)

	cancelBtn.MouseButton1Click:Connect(function()
		playSound(1524543584)
		closeGui()
	end)

	linkBtn.MouseButton1Click:Connect(function()
		playSound(7433801607)
		setclipboard(tostring(link))
	end)

	repeat task.wait() until Whitelisted
end

return WhitelistCreate
