local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/WasKKal/-/refs/heads/main/WindQW.lua"))()
local Window = WindUI:CreateWindow({
    Title = "YG SCRIPT<font color='#FFAEC4'></font>",
    Author = "重型钓鱼老外制作（小徐翻译）",
    Folder = "HeavyFishing",
    Size = UDim2.fromOffset(500, 100),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = false,
        Callback = function() print("clicked") end,
        Anonymous = false
    },
    SideBarWidth = 135,
    ScrollBarEnabled = true,
    Background = "https://raw.gifmaker_edit_936115200583200.jpg",
    BackgroundImageTransparency = 0.5,
})

Window:EditOpenButton({
    Title = "YG SCRIPT<font color='#FFAEC4'></font>",
    CornerRadius = UDim.new(16,16),
    StrokeThickness = 2.5,
    Color = ColorSequence.new(
        Color3.fromHex("#30FF6A"),
        Color3.fromHex("#e7ff2f")
    ),
    Draggable = true,
})

local COLOR_SCHEMES = {
    ["彩虹颜色"] = {ColorSequence.new({
        ColorSequenceKeypoint.new(0,    Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.16, Color3.fromHex("FFA500")),
        ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.5,  Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
        ColorSequenceKeypoint.new(1,    Color3.fromHex("EE82EE"))
    }), "palette"},
    ["绿黄渐变"] = {ColorSequence.new({
        ColorSequenceKeypoint.new(0,   Color3.fromHex("30FF6A")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("a8ff00")),
        ColorSequenceKeypoint.new(1,   Color3.fromHex("e7ff2f"))
    }), "waves"},
}

local borderAnimation
local animationSpeed = 5

local function createRainbowBorder(window, colorScheme)
    local mainFrame = window.UIElements.Main
    if not mainFrame then return nil end
    local existingStroke = mainFrame:FindFirstChild("RainbowStroke")
    if existingStroke then existingStroke:Destroy() end
    if not mainFrame:FindFirstChildOfClass("UICorner") then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 16)
        corner.Parent = mainFrame
    end
    local rainbowStroke = Instance.new("UIStroke")
    rainbowStroke.Name = "RainbowStroke"
    rainbowStroke.Thickness = 2
    rainbowStroke.Color = Color3.new(1, 1, 1)
    rainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    rainbowStroke.LineJoinMode = Enum.LineJoinMode.Round
    rainbowStroke.Parent = mainFrame
    local glowEffect = Instance.new("UIGradient")
    glowEffect.Name = "GlowEffect"
    local schemeData = COLOR_SCHEMES[colorScheme or "彩虹颜色"]
    glowEffect.Color = schemeData and schemeData[1] or COLOR_SCHEMES["彩虹颜色"][1]
    glowEffect.Rotation = 0
    glowEffect.Parent = rainbowStroke
    return rainbowStroke
end

local function startBorderAnimation(window, speed)
    local mainFrame = window.UIElements.Main
    if not mainFrame then return nil end
    local rainbowStroke = mainFrame:FindFirstChild("RainbowStroke")
    if not rainbowStroke then return nil end
    local glowEffect = rainbowStroke:FindFirstChild("GlowEffect")
    if not glowEffect then return nil end
    return game:GetService("RunService").Heartbeat:Connect(function()
        if not rainbowStroke or rainbowStroke.Parent == nil then return end
        glowEffect.Rotation = (tick() * speed * 10) % 360
    end)
end

local rainbowStroke = createRainbowBorder(Window, "彩虹颜色")
if rainbowStroke then
    borderAnimation = startBorderAnimation(Window, animationSpeed)
end

local Lighting = game:GetService("Lighting")
local TweenServiceBlur = game:GetService("TweenService")
local blur = Lighting:FindFirstChildOfClass("BlurEffect")
if not blur then
    blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting
end

task.spawn(function()
    local wasOpen = false
    while true do
        task.wait(0.1)
        local mainFrame = Window.UIElements and Window.UIElements.Main
        local isOpen = mainFrame and mainFrame.Visible or false
        if isOpen ~= wasOpen then
            wasOpen = isOpen
            TweenServiceBlur:Create(blur, TweenInfo.new(0.3), {
                Size = isOpen and 20 or 0
            }):Play()
        end
    end
end)

_G.AutoFishingEnabled = false
_G.AutoCastEnabled = false
_G.AutoSkillEnabled = false
_G.AutoSellEnabled = false
_G.AutoTeleToBoss = false
_G.AutoSkillF = false
_G.SkillFDelay = 5
_G.AutoTeleToMerchant = false

local mainTab = Window:Tab({ Title = "功能", Icon = "fish" })
Window:SelectTab(1)

mainTab:Toggle({ Title = "抛竿自动", Value = false, Callback = function(state) _G.AutoCastEnabled = state end })
mainTab:Toggle({ Title = "钓鱼自动", Value = false, Callback = function(state) _G.AutoFishingEnabled = state end })
mainTab:Toggle({ Title = "技能自动", Value = false, Callback = function(state) _G.AutoSkillEnabled = state end })
mainTab:Toggle({ Title = "自动杆门断", Value = false, Callback = function(state) _G.AutoSkillF = state end })
mainTab:Input({
    Title = "杆门断释放延迟",
    Placeholder = "默认30秒",
    Value = "30",
    Callback = function(text)
        local num = tonumber(text)
        if num and num >= 0 then
            _G.SkillFDelay = num
        end
    end
})
mainTab:Toggle({ Title = "卖鱼自动", Value = false, Callback = function(state) _G.AutoSellEnabled = state end })
mainTab:Toggle({ Title = "传送Boss自动", Value = false, Callback = function(state) _G.AutoTeleToBoss = state end })

local autoDeleteAFK = false
mainTab:Toggle({
    Title = "阻止自动换服",
    Value = false,
    Callback = function(state)
        autoDeleteAFK = state
        if state then
            local searchAreas = {
                game.Players.LocalPlayer,
                workspace,
                game:GetService("ReplicatedStorage"),
                game:GetService("Lighting")
            }
            local function wipeAFK()
                local count = 0
                for _, area in ipairs(searchAreas) do
                    pcall(function()
                        for _, obj in ipairs(area:GetDescendants()) do
                            if obj.Name == "AFK" or string.match(string.upper(obj.Name), "^AFK$") then
                                pcall(function()
                                    if obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                                        obj.Disabled = true
                                    end
                                    obj:Destroy()
                                    count = count + 1
                                end)
                            end
                        end
                    end)
                end
                return count
            end
            local initialCount = wipeAFK()
            warn("首次清理了 " .. initialCount .. " 个 AFK 相关对象")
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "AFK 清理启动",
                Text = "已删除 " .. initialCount .. " 个对象，后台持续监控中...",
                Duration = 3
            })
            task.spawn(function()
                while autoDeleteAFK do
                    task.wait(1.5)
                    wipeAFK()
                end
            end)
        end
    end
})

local bypassCount = 0
local afkConnection = nil
mainTab:Toggle({
    Title = "反挂机",
    Value = false,
    Callback = function(state)
        if state then
            bypassCount = 0
            afkConnection = game.Players.LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new(0, 0))
                bypassCount = bypassCount + 1
            end)
        else
            if afkConnection then afkConnection:Disconnect() afkConnection = nil end
        end
    end
})

mainTab:Toggle({
    Title = "自动小道士传送",
    Value = false,
    Callback = function(state) _G.AutoTeleToMerchant = state end
})

local isSpeedEnabled = false
local speedValue = 50
mainTab:Toggle({
    Title = "人物加速",
    Value = false,
    Callback = function(state)
        isSpeedEnabled = state
        local player = game.Players.LocalPlayer
        if not state then
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = 16
            end
        end
    end
})
mainTab:Slider({
    Title = "加速速度",
    Value = {
        Min = 16,
        Max = 200,
        Default = 50,
    },
    Callback = function(value)
        speedValue = value
        if isSpeedEnabled then
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = speedValue
            end
        end
    end
})

local teleportTab = Window:Tab({ Title = "传送", Icon = "map-pin" })
local function TeleportTo(coords)
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(coords)
    end
end

local locations = {
    {Name = "初始岛屿", Coords = Vector3.new(-283.78, 11.06, 37.06)},
    {Name = "竹子岛", Coords = Vector3.new(-1194.62, 5.57, -30.08)},
    {Name = "核弹岛", Coords = Vector3.new(-48.12, 5.88, 1234.68)},
    {Name = "主权岛屿", Coords = Vector3.new(-1174.37, 7.26, 1279.27)},
    {Name = "鲈鱼岛", Coords = Vector3.new(-63.82, 11.11, -1361.63)},
    {Name = "冰霜岛屿", Coords = Vector3.new(-1389.85, 9.50, -1397.23)},
    {Name = "椰子岛", Coords = Vector3.new(1431.24, 11.14, -1445.49)},
    {Name = "琥珀岛", Coords = Vector3.new(1123.59, 10.86, 1414.99)},
    {Name = "战场岛", Coords = Vector3.new(1342.56, 9.64, 229.71)}
}

for _, loc in ipairs(locations) do
    teleportTab:Button({
        Title = "传送至: " .. loc.Name,
        Callback = function() TeleportTo(loc.Coords) end
    })
end

task.spawn(function()
    while true do
        if _G.AutoTeleToBoss then
            pcall(function()
                local boss = workspace:FindFirstChild("Ocean") and workspace.Ocean:FindFirstChild("Boss")
                if boss and game.Players.LocalPlayer.Character then
                    game.Players.LocalPlayer.Character:PivotTo(boss:GetPivot() * CFrame.new(0, 5, 0))
                end
            end)
        end
        task.wait(0.5)
    end
end)

task.spawn(function()
    local LocalPlayer = game.Players.LocalPlayer
    local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
    local isPlaying = false
    task.spawn(function()
        while true do
            task.wait(1)
            if _G.AutoCastEnabled and not workspace:FindFirstChild(LocalPlayer.Name):FindFirstChild("Buoy") then
                Events.Fishing:FireServer()
            end
        end
    end)
    task.spawn(function()
        while true do
            task.wait(0.01)
            if not _G.AutoFishingEnabled or not isPlaying then continue end
            local fishingGui = LocalPlayer.PlayerGui:FindFirstChild("MainGui") and LocalPlayer.PlayerGui.MainGui:FindFirstChild("Fishing")
            if fishingGui and fishingGui.Visible then
                local bar = fishingGui.BarFrame.Bar
                bar.Position = UDim2.new(0.5, 0, bar.Position.Y.Scale, bar.Position.Y.Offset)
            else
                isPlaying = false
            end
        end
    end)
    Events.Slam.OnClientEvent:Connect(function()
        if _G.AutoFishingEnabled then pcall(function() LocalPlayer.PlayerGui.MainGui.Fishing.TrashCan.Slam.Button.MouseButton1Click:Fire() end) end
    end)
    Events.Charge.OnClientEvent:Connect(function()
        if _G.AutoFishingEnabled then pcall(function() LocalPlayer.PlayerGui.MainGui.Fishing.TrashCan.Charge.Button.MouseButton1Click:Fire() end) end
    end)
    Events.FishingMinigame.OnClientEvent:Connect(function()
        if _G.AutoFishingEnabled then isPlaying = true end
    end)
end)

task.spawn(function()
    local Event = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UseSkill")
    local keys = {"Z", "C", "V", "X"}
    while true do
        if _G.AutoSkillEnabled then
            for _, key in ipairs(keys) do Event:FireServer(key) end
        end
        task.wait(0.1)
    end
end)

task.spawn(function()
    local SellEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SellFish")
    while true do
        if _G.AutoSellEnabled then SellEvent:FireServer("All") end
        task.wait(2)
    end
end)

task.spawn(function()
    while true do
        task.wait(0.5)
        if isSpeedEnabled then
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                if player.Character.Humanoid.WalkSpeed ~= speedValue then
                    player.Character.Humanoid.WalkSpeed = speedValue
                end
            end
        end
    end
end)

task.spawn(function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local TARGET_ANIMATIONS = {
        "rbxassetid://139310377090355",
        "rbxassetid://126829237727532",
        "rbxassetid://93648246978510"
    }
    local busy = false
    local function HookCharacter(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.AnimationPlayed:Connect(function(track)
            local anim = track.Animation
            if not _G.AutoSkillF then return end
            if busy then return end
            if anim and anim.AnimationId == TARGET_ANIMATION then
                busy = true
                print("检测到技能动画，".._G.SkillFDelay.."秒后按 F")
                task.delay(_G.SkillFDelay, function()
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                    task.wait(0.05)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
                    print("已自动按 F")
                    task.wait(1)
                    busy = false
                end)
            end
        end)
    end
    if player.Character then HookCharacter(player.Character) end
    player.CharacterAdded:Connect(HookCharacter)
end)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer
task.spawn(function()
    while true do
        task.wait(0.5)
        if _G.AutoTeleToMerchant then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local npcFolder = Workspace:FindFirstChild("NPC")
                if npcFolder then
                    local merchant = npcFolder:FindFirstChild("Merchant", true)
                    if merchant and merchant:IsA("Model") then
                        local targetCFrame = merchant:GetPivot()
                        character:PivotTo(targetCFrame * CFrame.new(0, 0, -3))
                    end
                end
            end
        end
    end
end)

local SnowModule = {}
local SnowFolder = Instance.new("Folder")
SnowFolder.Name = "SnowEffects"
SnowFolder.Parent = workspace
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local SnowSettings = {
    Speed = 4,
    Density = 60,
    Size = Vector2.new(0.8, 0.8),
    Lifetime = 8,
    WindX = 0.5
}
local SnowEnabled = false
local SnowConnections = {}
local ActiveSnowflakes = {}
local function CreateSnowflake()
    local snow = Instance.new("Part")
    snow.Name = "Snowflake"
    snow.Size = Vector3.new(SnowSettings.Size.X, 0.1, SnowSettings.Size.Y)
    snow.Anchored = true
    snow.CanCollide = false
    snow.Transparency = 0.2
    snow.BrickColor = BrickColor.new("White")
    snow.Material = Enum.Material.SmoothPlastic
    snow.Parent = SnowFolder
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 20, 0, 20)
    billboard.AlwaysOnTop = true
    billboard.Parent = snow
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(1, 1, 1)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = billboard
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = frame
    return snow
end
local function SpawnSnowflake()
    if not Camera then return end
    local camCFrame = Camera.CFrame
    local spawnX = math.random(-50, 50) + camCFrame.X
    local spawnZ = math.random(-50, 50) + camCFrame.Z
    local spawnY = camCFrame.Y + 30
    local snowflake = CreateSnowflake()
    snowflake.CFrame = CFrame.new(spawnX, spawnY, spawnZ)
    table.insert(ActiveSnowflakes, snowflake)
    local tweenInfo = TweenInfo.new(
        SnowSettings.Lifetime,
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.InOut,
        0,
        false,
        0
    )
    local endPos = Vector3.new(
        spawnX + (math.random() * SnowSettings.WindX * 20),
        camCFrame.Y - 20,
        spawnZ + (math.random() * SnowSettings.WindX * 10)
    )
    local tween = TweenService:Create(snowflake, tweenInfo, {CFrame = CFrame.new(endPos)})
    tween:Play()
    task.delay(SnowSettings.Lifetime, function()
        if snowflake:IsDescendantOf(game) then
            snowflake:Destroy()
            for i, v in ipairs(ActiveSnowflakes) do
                if v == snowflake then
                    table.remove(ActiveSnowflakes, i)
                    break
                end
            end
        end
    end)
end
local function SnowLoop()
    if #ActiveSnowflakes < SnowSettings.Density then
        for i = 1, math.floor(SnowSettings.Density / 10) do
            task.spawn(SpawnSnowflake)
        end
    end
end
function SnowModule:ToggleSnow(enabled)
    SnowEnabled = enabled
    if SnowEnabled then
        SnowConnections[1] = RunService.RenderStepped:Connect(SnowLoop)
    else
        for _, conn in pairs(SnowConnections) do
            conn:Disconnect()
        end
        SnowConnections = {}
        for _, snow in pairs(ActiveSnowflakes) do
            if snow:IsDescendantOf(game) then
                snow:Destroy()
            end
        end
        ActiveSnowflakes = {}
    end
end
function SnowModule:Destroy()
    self:ToggleSnow(false)
    SnowFolder:Destroy()
end

local snowToggle = mainTab:Toggle({
    Title = "启用下雪效果",
    Value = false,
    Callback = function(state)
        SnowModule:ToggleSnow(state)
    end
})

Window:OnClose(function()
    SnowModule:Destroy()
    print("UI closed.")
end)
