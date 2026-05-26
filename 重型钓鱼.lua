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
    Folder = 'Aero',
    Title = 'Aero      ',
    SideBarWidth = 180,
    Topbar = {
        Height = 44,
        ButtonsType = 'Mac',
    },
    Background = 'https://chaton-images.s3.us-east-2.amazonaws.com/GHn9L9UJLf0XcVNyCpbG72D0rmNmBEWndPkh6CjJNya8GLnWzz1vImvt8wlJSBwv_2700x1519x1393696.jpeg',
    OpenButton = {
        StrokeThickness = 3,
        Color = ColorSequence.new(Color3.fromHex('#30FF6A'), Color3.fromHex('#e7ff2f')),
        Title = '\u{6253}\u{5f00}\u{811a}\u{672c}',
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
    Title = '\u{4f0a}\u{6563}',
    Icon = 'crown',
})
_call31:Tag({
    Color = Color3.fromHex('#30ff6a'),
    Radius = 2,
    Title = '\u{82cf}\u{8fbe}',
    Icon = 'square-chevron-right',
})

local _call73 = ColorSequence.new({
    [1] = ColorSequenceKeypoint.new(0, Color3.fromHex('FF0000')),
    [2] = ColorSequenceKeypoint.new(0.16, Color3.fromHex('FFA500')),
    [3] = ColorSequenceKeypoint.new(0.33, Color3.fromHex('FFFF00')),
    [4] = ColorSequenceKeypoint.new(0.5, Color3.fromHex('00FF00')),
    [5] = ColorSequenceKeypoint.new(0.66, Color3.fromHex('0000FF')),
    [6] = ColorSequenceKeypoint.new(0.83, Color3.fromHex('4B0082')),
    [7] = ColorSequenceKeypoint.new(1, Color3.fromHex('EE82EE')),
})

ColorSequence.new({
    [1] = ColorSequenceKeypoint.new(0, Color3.fromHex('30FF6A')),
    [2] = ColorSequenceKeypoint.new(0.5, Color3.fromHex('a8ff00')),
    [3] = ColorSequenceKeypoint.new(1, Color3.fromHex('e7ff2f')),
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
    Title = '\u{529f}\u{80fd}',
    Icon = 'fish',
})

_call31:SelectTab(1)
_call135:Toggle({
    Value = false,
    Title = '\u{81ea}\u{52a8}\u{629b}\u{7aff}',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = '\u{81ea}\u{52a8}\u{9493}\u{9c7c}',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = '\u{81ea}\u{52a8}\u{6280}\u{80fd}',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = '\u{81ea}\u{52a8}\u{5356}\u{9c7c}',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = '\u{81ea}\u{52a8}\u{4f20}\u{9001}Boss',
    Callback = function(...) end,
})
_call135:Button({
    Title = '\u{963b}\u{6b62}\u{81ea}\u{52a8}\u{6362}\u{670d}(\u{5fc5}\u{5f00})',
    Callback = function(...) end,
})
_call135:Toggle({
    Value = false,
    Title = 'AFK(\u{5fc5}\u{5f00})',
    Callback = function(...) end,
})

local _call153 = _call31:Tab({
    Title = '\u{4f20}\u{9001}',
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
    Title = '\u{4f20}\u{9001}\u{81f3}: \u{521d}\u{59cb}\u{5c9b}\u{5c7f}',
    Callback = function(...) end,
})
_call153:Button({
    Title = '\u{4f20}\u{9001}\u{81f3}: \u{7af9}\u{5b50}\u{5c9b}',
    Callback = function(...) end,
})
_call153:Button({
    Title = '\u{4f20}\u{9001}\u{81f3}: \u{6838}\u{5f39}\u{5c9b}',
    Callback = function(...) end,
})
_call153:Button({
    Title = '\u{4f20}\u{9001}\u{81f3}: \u{4e3b}\u{6743}\u{5c9b}\u{5c7f}',
    Callback = function(...) end,
})
_call153:Button({
    Title = '\u{4f20}\u{9001}\u{81f3}: \u{9c88}\u{9c7c}\u{5c9b}',
    Callback = function(...) end,
})
_call153:Button({
    Title = '\u{4f20}\u{9001}\u{81f3}: \u{51b0}\u{971c}\u{5c9b}\u{5c7f}',
    Callback = function(...) end,
})
_call153:Button({
    Title = '\u{4f20}\u{9001}\u{81f3}: \u{6930}\u{5b50}\u{5c9b}',
    Callback = function(...) end,
})
_call153:Button({
    Title = '\u{4f20}\u{9001}\u{81f3}: \u{7425}\u{73c0}\u{5c9b}',
    Callback = function(...) end,
})
_call153:Button({
    Title = '\u{4f20}\u{9001}\u{81f3}: \u{6218}\u{573a}\u{5c9b}',
    Callback = function(...) end,
})
task.spawn(function(...) end)
task.spawn(function(...) end)
task.spawn(function(...) end)
task.spawn(function(...) end)
