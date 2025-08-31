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

	local gui = createObject("ScreenGui", {
		Name = "Rnd",
		Parent = game.CoreGui,
	})

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
	createObject("UIStroke", {
		Parent = mainFrame,
		Thickness = 3.8,
		Transparency = 0.9,
	})

	local titleLabel = createObject("TextLabel", {
		Parent = mainFrame,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.06, 0, 0.08, 0),
		Size = UDim2.new(0, 187, 0, 18),
		Font = Enum.Font.Gotham,
		Text = title or "Air Key",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local subLabel = createObject("TextLabel", {
		Parent = mainFrame,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.06, 0, 0.16, 0),
		Size = UDim2.new(0, 270, 0, 11),
		Font = Enum.Font.Gotham,
		Text = subtitle or "A simple key system using work.ink",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 10,
		TextTransparency = 0.47,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local inputBox = createObject("TextBox", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(61, 61, 61),
		BorderSizePixel = 0,
		Position = UDim2.new(0.064, 0, 0.266, 0),
		Size = UDim2.new(0, 235, 0, 21),
		Font = Enum.Font.SourceSans,
		PlaceholderText = "Enter Key or Code provided by work.ink",
		Text = "",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	createObject("UIStroke", {
		Parent = inputBox,
		Color = Color3.fromRGB(99, 99, 99),
		Thickness = 0.7,
	})
	createObject("UIPadding", {
		Parent = inputBox,
		PaddingLeft = UDim.new(0, 9),
	})

	local loginBtn = createObject("TextButton", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(91, 161, 78),
		BorderSizePixel = 0,
		Position = UDim2.new(0.064, 0, 0.401, 0),
		Size = UDim2.new(0, 63, 0, 21),
		Text = "LOGIN",
		TextColor3 = Color3.new(1, 1, 1),
		Font = Enum.Font.Gotham,
	})

	createObject("UIStroke", {
		Parent = loginBtn,
		Color = Color3.fromRGB(115, 238, 101),
		Thickness = 0.7,
	})

	local linkBtn = createObject("TextButton", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(83, 145, 162),
		BorderSizePixel = 0,
		Position = UDim2.new(0.294, 0, 0.401, 0),
		Size = UDim2.new(0, 84, 0, 21),
		Text = "GET LINK",
		TextColor3 = Color3.new(1, 1, 1),
		Font = Enum.Font.Gotham,
	})
	createObject("UIStroke", {
		Parent = linkBtn,
		Color = Color3.fromRGB(124, 221, 243),
		Thickness = 0.7,
		Transparency = 0.1,
	})

	local cancelBtn = createObject("TextButton", {
		Parent = mainFrame,
		BackgroundColor3 = Color3.fromRGB(153, 88, 88),
		BorderSizePixel = 0,
		Position = UDim2.new(0.064, 0, 0.834, 0),
		Size = UDim2.new(0, 63, 0, 21),
		Text = "CANCEL",
		TextColor3 = Color3.new(1, 1, 1),
		Font = Enum.Font.Gotham,
	})
	createObject("UIStroke", {
		Parent = cancelBtn,
		Color = Color3.fromRGB(255, 151, 151),
		Thickness = 0.7,
	})

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

	game.TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 326, 0, 229)
	}):Play()

	loginBtn.MouseButton1Click:Connect(function()
		if inputBox.Text:len() == 36 and checkKey(inputBox.Text) then
			Whitelisted = true
			gui:Destroy()
		else
			warn("Invalid key")
		end
	end)

	cancelBtn.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)

	linkBtn.MouseButton1Click:Connect(function()
		setclipboard(tostring(link))
	end)

	repeat task.wait() until Whitelisted
end

return WhitelistCreate
