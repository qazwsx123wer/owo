-- 重型钓鱼 纯净脚本
local Aero = loadstring(game:HttpGet('https://raw.githubusercontent.com/Yisan886/Aero/refs/heads/main/ui.lua.txt'))()

-- 主题设置
Aero:AddTheme({
    Outline = Color3.fromHex('#FFFFFF'),
    Placeholder = Color3.fromHex('#7a7a7a'),
    Name = 'My Theme',
    Text = Color3.fromHex('#FFFFFF'),
    Button = Color3.fromHex('#52525b'),
    Background = Color3.fromHex('#101010'),
    Icon = Color3.fromHex('#a1a1aa'),
    Accent = Color3.fromHex('#18181b'),
})

-- 创建窗口
local Window = Aero:CreateWindow({
    Folder = 'Aero',
    Title = 'Aero',
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

-- 标签
Window:Tag({Color = Color3.fromHex('00CED1'), Radius = 2, Title = 'V1.03'})
Window:Tag({Color = Color3.fromHex('FFD700'), Radius = 2, Title = '一散', Icon = 'crown'})
Window:Tag({Color = Color3.fromHex('#30ff6a'), Radius = 2, Title = '搬运', Icon = 'square-chevron-right'})

-- 彩虹渐变
local Rainbow = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromHex('FF0000')),
    ColorSequenceKeypoint.new(0.16, Color3.fromHex('FFA500')),
    ColorSequenceKeypoint.new(0.33, Color3.fromHex('FFFF00')),
    ColorSequenceKeypoint.new(0.5, Color3.fromHex('00FF00')),
    ColorSequenceKeypoint.new(0.66, Color3.fromHex('0000FF')),
    ColorSequenceKeypoint.new(0.83, Color3.fromHex('4B0082')),
    ColorSequenceKeypoint.new(1, Color3.fromHex('EE82EE')),
})

-- UI边框特效
local Main = Window.UIElements.Main
local OldStroke = Main:FindFirstChild('RainbowStroke')
if OldStroke then OldStroke:Destroy() end

local UIStroke = Instance.new('UIStroke')
UIStroke.Name = 'RainbowStroke'
UIStroke.Thickness = 2
UIStroke.Color = Color3.new(1,1,1)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Parent = Main

local UIGradient = Instance.new('UIGradient')
UIGradient.Name = 'GlowEffect'
UIGradient.Color = Rainbow
UIGradient.Rotation = 0
UIGradient.Parent = UIStroke

-- 全局开关
_G.AutoFishingEnabled = false
_G.AutoCastEnabled = false
_G.AutoSkillEnabled = false
_G.AutoSellEnabled = false
_G.AutoTeleToBoss = false

-- 功能页
local FuncTab = Window:Tab({Title = '功能', Icon = 'fish'})
Window:SelectTab(1)

FuncTab:Toggle({Value = false, Title = '自动抛竿', Callback = function(v) _G.AutoCastEnabled = v end})
FuncTab:Toggle({Value = false, Title = '自动钓鱼', Callback = function(v) _G.AutoFishingEnabled = v end})
FuncTab:Toggle({Value = false, Title = '自动技能', Callback = function(v) _G.AutoSkillEnabled = v end})
FuncTab:Toggle({Value = false, Title = '自动卖鱼', Callback = function(v) _G.AutoSellEnabled = v end})
FuncTab:Toggle({Value = false, Title = '自动传送Boss', Callback = function(v) _G.AutoTeleToBoss = v end})
FuncTab:Button({Title = '阻止自动换装(必开)', Callback = function() end})
FuncTab:Toggle({Value = false, Title = 'AFK(必开)', Callback = function() end})

-- 传送坐标
local Pos = {
    初始岛屿 = Vector3.new(-283.78, 11.06, 37.06),
    竹子岛 = Vector3.new(-1194.62, 5.57, -30.08),
    核弹岛 = Vector3.new(-48.12, 5.88, 1234.68),
    主权岛屿 = Vector3.new(-1174.37, 7.26, 1279.27),
    鲨鱼岛 = Vector3.new(-63.82, 11.11, -1361.63),
    冰霜岛屿 = Vector3.new(-1389.85, 9.5, -1397.23),
    橙子岛 = Vector3.new(1431.24, 11.14, -1445.49),
    钻石岛 = Vector3.new(1123.59, 10.86, 1414.99),
    战场岛 = Vector3.new(1342.56, 9.64, 229.71),
}

-- 传送页
local TeleTab = Window:Tab({Title = '传送', Icon = 'map-pin'})
for name, pos in pairs(Pos) do
    TeleTab:Button({
        Title = '传送至: '..name,
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
        end
    })
end

-- 后台循环
game:GetService('RunService').Heartbeat:Connect(function() end)
task.spawn(function() end)
