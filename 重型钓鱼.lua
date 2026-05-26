local _5 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Yisan886/Aero/refs/heads/main/ui.lua.txt'))()
_5:AddTheme({
    Outline = Color3.fromHex('#FFFFFF'),
    Placeholder = Color3.fromHex('#7a7a7a'),
    Name = 'My Theme',
    Text = Color3.fromHex('#FFFFFF'),
    Button = Color3.fromHex('#52525b'),
    Background = Color3.fromHex('#101010'),
    Icon = Color3.fromHex('#a1a1aa'),
    Accent = Color3.fromHex('#18181b'),
})
local _call31 = _5:CreateWindow({
    Folder = '山',
    Title = '山      ',
    SideBarWidth = 180,
    Topbar = {
        Height = 44,
        ButtonsType = 'Mac',
    },
    Background = 'https://chaton-images.s3.us-east-2.amazonaws.com/GHn9L9UJLf0XcVNyCpbG72D0rmNmBEWndPkh6CjJNya8GLnWzz1vImvt8wlJSBwv_2700x1519x1393696.jpeg',
    OpenButton = {
        StrokeThickness = 3,
        Color = ColorSequence.new(Color3.fromHex('#30FF6A'), Color3.fromHex('#e7ff2f')),
        Title = '打开脚本',
        Enabled = true,
        Scale = 0.9,
        Draggable = true,
        OnlyMobile = false,
        CornerRadius = UDim.new(1, 0),
    },
    BackgroundImageTransparency = 0.5,
})
_call31:Tag({
    Color = Color3.fromHex('00CED1'),
    Radius = 2,
    Title = 'V1.03',
})
_call31:Tag({
    Color = Color3.fromHex('FFD700'),
    Radius = 2,
    Title = '小徐',
    Icon = 'crown',
})
_call31:Tag({
    Color = Color3.fromHex('#30ff6a'),
    Radius = 2,
    Title = '搬运',
    Icon = 'square-chevron-right',
})
local _call73 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex('FF0000')),
    ColorSequenceKeypoint.new(0.16, Color3.fromHex('FFA500')),
    ColorSequenceKeypoint.new(0.33, Color3.fromHex('FFFF00')),
    ColorSequenceKeypoint.new(0.5, Color3.fromHex('00FF00')),
    ColorSequenceKeypoint.new(0.66, Color3.fromHex('0000FF')),
    ColorSequenceKeypoint.new(0.83, Color3.fromHex('4B0082')),
    ColorSequenceKeypoint.new(1, Color3.fromHex('EE82EE')),
})
ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex('30FF6A')),
    ColorSequenceKeypoint.new(0.5, Color3.fromHex('a8ff00')),
    ColorSequenceKeypoint.new(1, Color3.fromHex('e7ff2f')),
})
local _Main89 = _call31.UIElements.Main
local _call92 = _Main89:FindFirstChild('RainbowStroke')
_call92:Destroy()
local _ = not _Main89:FindFirstChildOfClass('UICorner')
local _call100 = Instance.new('UIStroke')
_call100.Name = 'RainbowStroke'
_call100.Thickness = 2
_call100.Color = Color3.new(1, 1, 1)
_call100.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
_call100.LineJoinMode = Enum.LineJoinMode.Round
_call100.Parent = _Main89
local _call108 = Instance.new('UIGradient')
_call108.Name = 'GlowEffect'
_call108.Color = _call73
_call108.Rotation = 0
_call108.Parent = _call100
local _Main112 = _call31.UIElements.Main
local _call115 = _Main112:FindFirstChild('RainbowStroke')
local _ = not _call115:FindFirstChild('GlowEffect')
game:GetService('RunService').Heartbeat:Connect(function(...) end)
local _call126 = game:GetService('Lighting')
game:GetService('TweenService')
local _ = not _call126:FindFirstChildOfClass('BlurEffect')
task.spawn(function(...) end)
_G.AutoFishingEnabled = false
_G.AutoCastEnabled = false
_G.AutoSkillEnabled = false
_G.AutoSellEnabled = false
_G.AutoTeleToBoss = false
local _call135 = _call31:Tab({
    Title = '功能',
    Icon = 'fish',
})
_call31:SelectTab(1)
_call135:Toggle({
    Value = false,
    Title = '自动抛竿',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = '自动钓鱼',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = '自动技能',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = '自动卖鱼',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = '自动传送Boss',
    Callback = function(...) end,
})
_call135:Button({
    Title = '阻止自动换装(必开)',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = 'AFK(必开)',
    Callback = function(...) end,
})
local _call153 = _call31:Tab({
    Title = '传送',
    Icon = 'map-pin',
})
Vector3.new(-283.78, 11.06, 37.06)
Vector3.new(-1194.62, 5.57, -30.08)
Vector3.new(-48.12, 5.88, 1234.68)
Vector3.new(-1174.37, 7.26, 1279.27)
Vector3.new(-63.82, 11.11, -1361.63)
Vector3.new(-1389.85, 9.5, -1397.23)
Vector3.new(1431.24, 11.14, -1445.49)
Vector3.new(1123.59, 10.86, 1414.99)
Vector3.new(1342.56, 9.64, 229.71)
_call153:Button({
    Title = '传送至: 初始岛屿',
    Callback = function(...) end,
})
_call153:Button({
    Title = '传送至: 竹子岛',
    Callback = function(...) end,
})
_call153:Button({
    Title = '传送至: 核弹岛',
    Callback = function(...) end,
})
_call153:Button({
    Title = '传送至: 主权岛屿',
    Callback = function(...) end,
})
_call153:Button({
    Title = '传送至: 鲨鱼岛',
    Callback = function(...) end,
})
_call153:Button({
    Title = '传送至: 冰霜岛屿',
    Callback = function(...) end,
})
_call153:Button({
    Title = '传送至: 橙子岛',
    Callback = function(...) end,
})
_call153:Button({
    Title = '传送至: 钻石岛',
    Callback = function(...) end,
})
_call153:Button({
    Title = '传送至: 战场岛',
    Callback = function(...) end,
})
task.spawn(function(...) end)
task.spawn(function(...) end)
task.spawn(function(...) end)
task.spawn(function(...) end)
