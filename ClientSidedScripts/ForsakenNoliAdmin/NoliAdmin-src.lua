--[[
  _     _       _    _     _     _       
 | |   (_)     | |  (_)   | |   | |      
 | |__  _   ___| | ___  __| | __| |_   _ 
 | '_ \| | / __| |/ / |/ _` |/ _` | | | |
 | | | | | \__ \   <| | (_| | (_| | |_| |
 |_| |_|_| |___/_|\_\_|\__,_|\__,_|\__, |
                                    __/ |
                                   |___/ 
]]--

if not isfile("AdminNoli.rbxmx") then
writefile("AdminNoli.rbxmx", game:HttpGet("https://github.com/Snxdfer/scripts/raw/refs/heads/main/ClientSidedScripts/ForsakenNoliAdmin/AdminNoli.rbxmx"))
end

writefile("Admin1.mp3", game:HttpGet("https://github.com/Snxdfer/scripts/raw/refs/heads/main/ClientSidedScripts/ForsakenNoliAdmin/Admin1.mp3"))
writefile("Admin2.mp3", game:HttpGet("https://github.com/Snxdfer/scripts/raw/refs/heads/main/ClientSidedScripts/ForsakenNoliAdmin/Admin2.mp3"))
writefile("Admin3.mp3", game:HttpGet("https://github.com/Snxdfer/scripts/raw/refs/heads/main/ClientSidedScripts/ForsakenNoliAdmin/Admin3.mp3"))
writefile("Chase.mp3", game:HttpGet("https://github.com/Snxdfer/scripts/raw/refs/heads/main/ClientSidedScripts/ForsakenNoliAdmin/Chase.mp3"))
writefile("LMA.mp3", game:HttpGet("https://github.com/Snxdfer/scripts/raw/refs/heads/main/ClientSidedScripts/ForsakenNoliAdmin/LMA.mp3"))
writefile("Iron.mp3", game:HttpGet("https://github.com/Snxdfer/scripts/raw/refs/heads/main/ClientSidedScripts/ForsakenNoliAdmin/Iron.mp3"))

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Camera = Workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local hasAppliedAdminNoli = false

local tStyle = {
	[Enum.PoseEasingStyle.Linear] = Enum.EasingStyle.Linear,
	[Enum.PoseEasingStyle.Bounce] = Enum.EasingStyle.Bounce,
	[Enum.PoseEasingStyle.Cubic] = Enum.EasingStyle.Cubic,
	[Enum.PoseEasingStyle.Elastic] = Enum.EasingStyle.Elastic,
	[Enum.PoseEasingStyle.Constant] = Enum.EasingStyle.Linear,
}

local tDirection = {
	[Enum.PoseEasingDirection.In] = Enum.EasingDirection.In,
	[Enum.PoseEasingDirection.Out] = Enum.EasingDirection.Out,
	[Enum.PoseEasingDirection.InOut] = Enum.EasingDirection.InOut,
}

local function BuildTweens(Model, KeyFrameSequence, SpeedMult)
	SpeedMult = SpeedMult or 1
	local frames = {}
	for _, kf in ipairs(KeyFrameSequence:GetKeyframes()) do
		table.insert(frames, {Time = kf.Time, Keyframe = kf})
	end
	table.sort(frames, function(a,b) return a.Time < b.Time end)
	local tweens, motors, values, keyPoses = {}, {}, {}, {}
	local function GetMotorFromPose(pose)
		for _,v in pairs(Model:GetDescendants()) do
			if v:IsA("Motor6D") and v.Part1 and v.Part1.Name == pose.Name and v.Part0 and v.Part0.Name == pose.Parent.Name then
				return v
			end
		end
	end
	for i,frame in ipairs(frames) do
		keyPoses[i] = {Time = frame.Time, Poses={}}
		for _, pose in ipairs(frame.Keyframe:GetDescendants()) do
			if pose:IsA("Pose") and pose.Weight > 0 then
				local motor = motors[pose.Name] or GetMotorFromPose(pose)
				if motor then
					motors[pose.Name] = motor
					if not values[pose.Name] then
						local cv = Instance.new("CFrameValue")
						cv.Value = motor.Transform
						cv.Parent = motor
						values[pose.Name] = cv
					end
					keyPoses[i].Poses[pose.Name] = {Motor=motor, Pose=pose}
				end
			end
		end
	end
	if #keyPoses > 1 then
		local last = {}
		for i=1,#keyPoses-1 do
			local k1, k2 = keyPoses[i], keyPoses[i+1]
			local dur = (k2.Time - k1.Time) / SpeedMult
			tweens[i] = {Time = dur, Tweens={}}
			for n,d in pairs(k1.Poses) do last[n]=d end
			for n,d in pairs(k2.Poses) do
				if last[n] then
					local info = TweenInfo.new(dur, tStyle[d.Pose.EasingStyle], tDirection[d.Pose.EasingDirection])
					tweens[i].Tweens[n] = TweenService:Create(values[n], info, {Value=d.Pose.CFrame})
				end
			end
		end
	end
	local totalDuration = 0
	for _, segment in ipairs(tweens) do totalDuration = totalDuration + segment.Time end
	return tweens, motors, values, totalDuration
end

local function PlayKeyframeSequence(Model, KeyFrameSequence, SpeedMult, looped, onFinished)
	SpeedMult = SpeedMult or 1
	local tweens, motors, values, totalDuration = BuildTweens(Model, KeyFrameSequence, SpeedMult)
	local stopped = false
	local hb
	hb = RunService.Heartbeat:Connect(function()
		if stopped then if hb then hb:Disconnect() end return end
		for n,motor in pairs(motors) do motor.Transform = values[n].Value end
	end)
	local function loop()
		repeat
			for _, segment in ipairs(tweens) do
				for _, tw in pairs(segment.Tweens) do tw:Play() end
				task.wait(segment.Time)
				if stopped then break end
			end
			if not looped and not stopped then
				stopped = true
				if onFinished then onFinished() end
				break
			end
		until stopped
	end
	task.spawn(loop)
	return {
		stop = function()
			stopped = true
			if hb then hb:Disconnect() hb = nil end
			for _,v in pairs(values) do if v then v:Destroy() end end
		end,
		getLength = function() return totalDuration end
	}
end

local function CloneMe(char)
	if not char then return nil end
	char.Archivable = true
	local clone = char:Clone()
	char.Archivable = false
	return clone
end

local function setupCharacter()
	if hasAppliedAdminNoli then return end
	hasAppliedAdminNoli = true

	local Object = game:GetObjects(getcustomasset("AdminNoli.rbxmx"))[1]
	Object.Parent = workspace

	local adminGui = Object:FindFirstChild("Admin", true)
	while not adminGui do
		task.wait()
		adminGui = Object:FindFirstChild("Admin", true)
	end
	if adminGui and adminGui:IsA("ScreenGui") then
		adminGui.Parent = LocalPlayer.PlayerGui
	end

	local adminModel = Object.Admin
	if not adminModel then return end

	local Player = LocalPlayer
	local CurrentCF = Player.Character.HumanoidRootPart.CFrame
	local CurrentChar = Player.Character
	adminModel.Parent = workspace
	adminModel.Name = CurrentChar.Name
	adminModel.HumanoidRootPart.CFrame = CurrentCF
	Player.Character = adminModel
	CurrentChar:Destroy()

	Camera.CameraSubject = adminModel.Humanoid

	local character = adminModel
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		local animator = humanoid:FindFirstChildOfClass("Animator")
		if animator then animator:Destroy() end
	end

	task.wait(0.1)

	local introAnim = Object:FindFirstChild("Intro")
	local idleAnim = Object:FindFirstChild("Idle")
	local walkAnim = Object:FindFirstChild("Walk")
	local runAnim = Object:FindFirstChild("Run")
	local novaAnim = Object:FindFirstChild("Nova")
	local m1Anim = Object:FindFirstChild("M1")
	local observantAnim = Object:FindFirstChild("Observant")
	local teleportAnim = Object:FindFirstChild("Teleport")
	local voidStartAnim = Object:FindFirstChild("VoidStart")
	local voidLoopAnim = Object:FindFirstChild("VoidLoop")
	local voidMissAnim = Object:FindFirstChild("VoidMiss")
	local slamAnim = Object:FindFirstChild("Slam")
	local slamVictimAnim = Object:FindFirstChild("SlamVictim")
	local executionAnim = Object:FindFirstChild("Execution")
	local executionVictimAnim = Object:FindFirstChild("ExecutionVictim")

	if not (introAnim and idleAnim and walkAnim and runAnim) then
		warn("Missing animations: Intro, Idle, Walk, Run")
		return
	end

	local sound = Instance.new("Sound")
	sound.SoundId = getcustomasset("Iron.mp3")
	sound.Volume = 5
	sound.Parent = Workspace
	sound.Looped = false
	sound:Play()

	local currentAnimObj = nil
	local isRunning = false
	local connections = {}
	local lastMagnitude = 0
	local setupComplete = false
	local isPlayingAbility = false
	local observantActive = false
	local clickConnection = nil

	local musicFolder = Instance.new("Folder")
	musicFolder.Name = "AdminMusic"
	musicFolder.Parent = Workspace

	local admin1 = Instance.new("Sound")
	admin1.SoundId = getcustomasset("Admin1.mp3")
	admin1.Volume = 0.8
	admin1.Looped = true
	admin1.Parent = musicFolder

	local admin2 = Instance.new("Sound")
	admin2.SoundId = getcustomasset("Admin2.mp3")
	admin2.Volume = 0.8
	admin2.Looped = true
	admin2.Parent = musicFolder

	local admin3 = Instance.new("Sound")
	admin3.SoundId = getcustomasset("Admin3.mp3")
	admin3.Volume = 0.8
	admin3.Looped = true
	admin3.Parent = musicFolder

	local chase = Instance.new("Sound")
	chase.SoundId = getcustomasset("Chase.mp3")
	chase.Volume = 1
	chase.Looped = true
	chase.Parent = musicFolder

	local lma = Instance.new("Sound")
	lma.SoundId = getcustomasset("LMA.mp3")
	lma.Volume = 1
	lma.Looped = true
	lma.Parent = musicFolder

	local currentMusic = nil
	local lmaEnabled = false

	local function stopAllMusic()
		for _, s in pairs(musicFolder:GetChildren()) do
			if s:IsA("Sound") then s:Stop() end
		end
		currentMusic = nil
	end

	local function playMusic(sound)
		if currentMusic == sound then return end
		stopAllMusic()
		sound:Play()
		currentMusic = sound
	end

	local lmsButton = Instance.new("TextButton")
	lmsButton.Size = UDim2.new(0, 200, 0, 50)
	lmsButton.Position = UDim2.new(0.5, -100, 0, 10)
	lmsButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	lmsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	lmsButton.Font = Enum.Font.GothamBold
	lmsButton.Text = "LMS OFF"
	lmsButton.TextScaled = true
	lmsButton.Parent = adminGui

	lmsButton.MouseButton1Click:Connect(function()
		lmaEnabled = not lmaEnabled
		lmsButton.Text = lmaEnabled and "LMS ON" or "LMS OFF"
		lmsButton.BackgroundColor3 = lmaEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
		if lmaEnabled then playMusic(lma) else stopAllMusic() end
	end)

	connections.terror = RunService.Heartbeat:Connect(function()
		if not character or not character:FindFirstChild("HumanoidRootPart") or lmaEnabled then return end
		local hrp = character.HumanoidRootPart
		local closestDist = math.huge
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				local dist = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
				if dist < closestDist then closestDist = dist end
			end
		end
		if closestDist <= 20 then playMusic(chase)
		elseif closestDist <= 40 then playMusic(admin3)
		elseif closestDist <= 60 then playMusic(admin2)
		elseif closestDist <= 80 then playMusic(admin1)
		else stopAllMusic() end
	end)

	local function playAnimation(anim, speedMult, looped, onFinish)
		if currentAnimObj then currentAnimObj.stop() currentAnimObj = nil end
		if anim then
			currentAnimObj = PlayKeyframeSequence(character, anim, speedMult or 2, looped, onFinish)
			return currentAnimObj
		end
	end

	playAnimation(introAnim, 2, false, function()
		sound:Destroy()
		setupComplete = true
		humanoid.WalkSpeed = 16
		playAnimation(idleAnim, 2, true)
	end)

	local abilityContainer = adminGui:WaitForChild("AbilityContainer")

	local novaButton = abilityContainer:FindFirstChild("Nova")
	if novaButton then
		novaButton.MouseButton1Click:Connect(function()
			if isPlayingAbility or not setupComplete then return end
			isPlayingAbility = true
			humanoid.WalkSpeed = 2

			task.spawn(function()
				task.wait(1)
				local voidstar = character:FindFirstChild("Voidstar")
				if voidstar then
					local voidstarClone = voidstar:Clone()
					voidstarClone.Parent = Workspace
					local hrp = character.HumanoidRootPart
					voidstarClone.CFrame = hrp.CFrame * CFrame.new(0, 0, -3)
					voidstarClone.CanCollide = true
					voidstarClone.Anchored = false

					local bodyPos = Instance.new("BodyPosition")
					bodyPos.MaxForce = Vector3.new(4000, 4000, 4000)
					bodyPos.P = 3000
					bodyPos.D = 500
					bodyPos.Position = voidstarClone.Position
					bodyPos.Parent = voidstarClone

					local bodyGyro = Instance.new("BodyGyro")
					bodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
					bodyGyro.P = 3000
					bodyGyro.D = 500
					bodyGyro.CFrame = Camera.CFrame
					bodyGyro.Parent = voidstarClone

					local startPos = voidstarClone.Position
					local direction = Camera.CFrame.LookVector
					local distance = 0
					local maxDistance = 200

					local connection
					connection = RunService.Heartbeat:Connect(function(dt)
						if not voidstarClone.Parent then if connection then connection:Disconnect() end return end
						distance = distance + 80 * dt
						if distance >= maxDistance then
							voidstarClone:Destroy()
							if connection then connection:Disconnect() end
							return
						end

						local targetPos = startPos + direction * distance
						bodyPos.Position = targetPos

						local rayParams = RaycastParams.new()
						rayParams.FilterDescendantsInstances = {character, voidstarClone}
						rayParams.FilterType = Enum.RaycastFilterType.Blacklist
						local result = workspace:Raycast(voidstarClone.Position, direction * 3, rayParams)
						if result then
							local explosionAttach = voidstarClone:FindFirstChild("Explosion")
							if explosionAttach then
								for _, emitter in pairs(explosionAttach:GetChildren()) do
									if emitter:IsA("ParticleEmitter") then emitter.Enabled = true end
								end
							end
							bodyPos:Destroy()
							bodyGyro:Destroy()
							if connection then connection:Disconnect() end

							for _, plr in pairs(Players:GetPlayers()) do
								if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
									local dist = (plr.Character.HumanoidRootPart.Position - result.Position).Magnitude
									if dist <= 50 then plr.Character.Humanoid:TakeDamage(15) end
								end
							end
							task.wait(0.5)
							if voidstarClone.Parent then voidstarClone:Destroy() end
						end
					end)
				end
			end)

			playAnimation(novaAnim, 2, false, function()
				isPlayingAbility = false
				humanoid.WalkSpeed = isRunning and 28 or 16
				if humanoid.MoveDirection.Magnitude > 0 then
					playAnimation(isRunning and runAnim or walkAnim, 2, true)
				else
					playAnimation(idleAnim, 2, true)
				end
			end)
		end)
	end

	local stabButton = abilityContainer:FindFirstChild("Stab")
	if stabButton then
		stabButton.MouseButton1Click:Connect(function()
			if isPlayingAbility or not setupComplete then return end
			isPlayingAbility = true

			playAnimation(m1Anim, 2, false)

			task.spawn(function()
				local hitbox = Instance.new("Part")
				hitbox.Size = Vector3.new(3, 3, 5)
				hitbox.Transparency = 1
				hitbox.CanCollide = false
				hitbox.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
				hitbox.Parent = Workspace
				local weld = Instance.new("WeldConstraint")
				weld.Part0 = character.HumanoidRootPart
				weld.Part1 = hitbox
				weld.Parent = hitbox
				local connection
				connection = hitbox.Touched:Connect(function(hit)
					if not hit or not hit.Parent or hit:IsDescendantOf(character) then return end
					local targetChar = hit:FindFirstAncestorWhichIsA("Model")
					if not targetChar then return end
					local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
					if not targetHum then return end
					local targetPlayer = Players:GetPlayerFromCharacter(targetChar)
					if not targetPlayer then return end
					local dmg = 20
					local isLastHit = (targetHum.Health - dmg <= 0)
					if isLastHit then
						targetHum.Health = 1
						local charClone = CloneMe(targetChar)
						if charClone then
							charClone.Parent = Workspace
							for _, obj in pairs(charClone:GetDescendants()) do
								if obj:IsA("Script") or obj:IsA("LocalScript") then obj:Destroy() end
							end
							local cloneHRP = charClone:FindFirstChild("HumanoidRootPart")
							if cloneHRP then
								cloneHRP.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2) * CFrame.Angles(0, math.pi, 0)
								local weldClone = Instance.new("WeldConstraint")
								weldClone.Part0 = character.HumanoidRootPart
								weldClone.Part1 = cloneHRP
								weldClone.Parent = cloneHRP

								humanoid.WalkSpeed = 0

								local animObj = PlayKeyframeSequence(character, executionAnim, 2, false)
								if executionVictimAnim then
									PlayKeyframeSequence(charClone, executionVictimAnim, 2, false, function()
										if charClone and charClone.Parent then charClone:Destroy() end
									end)
								end

								task.delay(animObj.getLength() + 1, function()
									if charClone and charClone.Parent then charClone:Destroy() end
									isPlayingAbility = false
									humanoid.WalkSpeed = isRunning and 28 or 16
									if humanoid.MoveDirection.Magnitude > 0 then
										playAnimation(isRunning and runAnim or walkAnim, 2, true)
									else
										playAnimation(idleAnim, 2, true)
									end
								end)

								targetHum:TakeDamage(dmg)
								targetHum.Health = targetHum.MaxHealth
							end
						end
						if connection then connection:Disconnect() connection = nil end
						if hitbox and hitbox.Parent then hitbox:Destroy() end
					else
						targetHum:TakeDamage(dmg)
						if connection then connection:Disconnect() connection = nil end
						if hitbox and hitbox.Parent then hitbox:Destroy() end
					end
				end)
				task.delay(2, function()
					if connection then connection:Disconnect() connection = nil end
					if hitbox and hitbox.Parent then hitbox:Destroy() end
				end)
			end)

			task.delay(PlayKeyframeSequence(character, m1Anim, 2, false).getLength(), function()
				if not isLastHit then
					isPlayingAbility = false
					if humanoid.MoveDirection.Magnitude > 0 then
						playAnimation(isRunning and runAnim or walkAnim, 2, true)
					else
						playAnimation(idleAnim, 2, true)
					end
				end
			end)
		end)
	end

	local observantButton = abilityContainer:FindFirstChild("Observant")
	if observantButton then
		observantButton.MouseButton1Click:Connect(function()
			if isPlayingAbility or observantActive or not setupComplete then return end
			isPlayingAbility = true
			observantActive = true
			humanoid.WalkSpeed = 2
			playAnimation(observantAnim, 2, true)

			clickConnection = UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
				if clickConnection then clickConnection:Disconnect() clickConnection = nil end

				local pos = input.UserInputType == Enum.UserInputType.Touch and input.Position or Vector2.new(LocalPlayer:GetMouse().X, LocalPlayer:GetMouse().Y)
				local ray = Camera:ScreenPointToRay(pos.X, pos.Y)
				local raycastParams = RaycastParams.new()
				raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
				raycastParams.FilterDescendantsInstances = {character}
				local result = Workspace:Raycast(ray.Origin, ray.Direction * 500, raycastParams)
				local targetPos = result and result.Position or (ray.Origin + ray.Direction * 500)

				local teleportObj = playAnimation(teleportAnim, 2, false)
				task.wait(1.5)
				if character and character:FindFirstChild("HumanoidRootPart") then
					character.HumanoidRootPart.CFrame = CFrame.new(targetPos + Vector3.new(0, 5, 0))
				end
				task.delay(teleportObj.getLength() + 1, function()
					if teleportObj then teleportObj.stop() end
					isPlayingAbility = false
					observantActive = false
					humanoid.WalkSpeed = isRunning and 28 or 16
					if humanoid.MoveDirection.Magnitude > 0 then
						playAnimation(isRunning and runAnim or walkAnim, 2, true)
					else
						playAnimation(idleAnim, 2, true)
					end
				end)
			end)
		end)
	end

	local voidRushButton = abilityContainer:FindFirstChild("VoidRush")
	if voidRushButton and voidStartAnim and voidLoopAnim and voidMissAnim and slamAnim and slamVictimAnim then
		voidRushButton.MouseButton1Click:Connect(function()
			if isPlayingAbility or not setupComplete then return end
			isPlayingAbility = true
			humanoid.WalkSpeed = 0

			playAnimation(voidStartAnim, 2, false, function()
				local loopObj = playAnimation(voidLoopAnim, 2, true)
				local startTime = tick()
				local hrp = character:FindFirstChild("HumanoidRootPart")

				local rushConn
				rushConn = RunService.Heartbeat:Connect(function()
					if not hrp or not hrp.Parent then if rushConn then rushConn:Disconnect() end return end
					if tick() - startTime >= 5 then
						if rushConn then rushConn:Disconnect() end
						if loopObj then loopObj.stop() end
						playAnimation(voidMissAnim, 2, false, function()
							isPlayingAbility = false
							humanoid.WalkSpeed = isRunning and 28 or 16
							if humanoid.MoveDirection.Magnitude > 0 then
								playAnimation(isRunning and runAnim or walkAnim, 2, true)
							else
								playAnimation(idleAnim, 2, true)
							end
						end)
						return
					end

					local lookVector = Camera.CFrame.LookVector
					local moveVector = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
					if moveVector.Magnitude == 0 then return end

					local newPos = hrp.Position + moveVector * 50 * RunService.Heartbeat:Wait()
					hrp.CFrame = CFrame.new(newPos, newPos + moveVector)

					local hitRay = Ray.new(hrp.Position, moveVector * 6)
					local hitPart = Workspace:FindPartOnRayWithIgnoreList(hitRay, {character})
					if hitPart and hitPart.Parent and hitPart.Parent:FindFirstChild("Humanoid") and hitPart.Parent ~= character then
						local victim = hitPart.Parent
						if rushConn then rushConn:Disconnect() end
						if loopObj then loopObj.stop() end

						hrp.CFrame = CFrame.new(hrp.Position, victim.HumanoidRootPart.Position)
						victim.Humanoid:TakeDamage(45)

						humanoid.WalkSpeed = 0
						playAnimation(slamAnim, 2, false)
						local clone = CloneMe(victim)
						if clone then
							clone.Parent = Workspace
							for _, obj in pairs(clone:GetDescendants()) do
								if obj:IsA("Script") or obj:IsA("LocalScript") then obj:Destroy() end
							end
							local cloneHRP = clone:FindFirstChild("HumanoidRootPart")
							if cloneHRP then
								cloneHRP.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2) * CFrame.Angles(0, math.pi, 0)
								local weld = Instance.new("WeldConstraint")
								weld.Part0 = character.HumanoidRootPart
								weld.Part1 = cloneHRP
								weld.Parent = cloneHRP

								PlayKeyframeSequence(clone, slamVictimAnim, 2, false, function()
									if clone and clone.Parent then clone:Destroy() end
								end)
							end
						end

						task.delay(PlayKeyframeSequence(character, slamAnim, 2, false).getLength(), function()
							isPlayingAbility = false
							humanoid.WalkSpeed = isRunning and 28 or 16
							if humanoid.MoveDirection.Magnitude > 0 then
								playAnimation(isRunning and runAnim or walkAnim, 2, true)
							else
								playAnimation(idleAnim, 2, true)
							end
						end)
					end
				end)
			end)
		end)
	end

	connections.move = RunService.Heartbeat:Connect(function()
		if not humanoid or not character.Parent or not setupComplete or isPlayingAbility then return end
		local magnitude = humanoid.MoveDirection.Magnitude
		if magnitude > 0 and lastMagnitude == 0 and humanoid.WalkSpeed > 2 then
			playAnimation(isRunning and runAnim or walkAnim, 2, true)
		elseif magnitude == 0 and lastMagnitude > 0 then
			playAnimation(idleAnim, 2, true)
		end
		lastMagnitude = magnitude
	end)

	local sprintButton = adminGui:WaitForChild("SprintingButton")
	if sprintButton then
		local function toggleRunState()
			if not setupComplete or isPlayingAbility then return end
			isRunning = not isRunning
			humanoid.WalkSpeed = isRunning and 28 or 16
			if humanoid.MoveDirection.Magnitude > 0 then
				playAnimation(isRunning and runAnim or walkAnim, 2, true)
			end
		end
		connections.toggle = sprintButton.MouseButton1Click:Connect(toggleRunState)
	end

	connections.cleanup = character.AncestryChanged:Connect(function()
		if not character.Parent then
			for _, conn in pairs(connections) do
				if conn and typeof(conn) == "RBXScriptConnection" then conn:Disconnect() end
			end
			if clickConnection then clickConnection:Disconnect() end
		end
	end)
end

local function onCharacterAdded(character)
	if not hasAppliedAdminNoli then
		task.wait(1)
		setupCharacter()
	end
end

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
if LocalPlayer.Character then onCharacterAdded(LocalPlayer.Character) end
