local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("山脚本[重制版]", "Default")

local tab1 = DrRayLibrary.newTab("通用", "ImageIdHere")

tab1.newLabel("通用脚本")

tab1.newButton("飞行脚本", "飞行可隐藏", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/AjDmq385'))()
end)

tab1.newButton("透视脚本", "透视所有玩家", function()
    if _G.Reantheajfdfjdgse then
    return
end

_G.Reantheajfdfjdgse = "susan"

local coregui = game:GetService("CoreGui")
local players = game:GetService("Players")
local plr = players.LocalPlayer

local highlights = {}

function esp(target, color)
    pcall(function()
        if target.Character then
            if not highlights[target] then
                local highlight = Instance.new("Highlight", coregui)
                highlight.Name = target.Name
                highlight.Adornee = target.Character
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor = color
                highlights[target] = highlight
            else
                highlights[target].FillColor = color
            end
        end
    end)
end

players.PlayerAdded:Connect(function(v)
    v.CharacterAdded:Connect(function()
        esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
    end)
end)

players.PlayerRemoving:Connect(function(v)
    if highlights[v] then
        highlights[v]:Destroy()
        highlights[v] = nil
        end
end)

for i, v in pairs(players:GetPlayers()) do
    if v ~= plr then
        local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
        v.CharacterAdded:Connect(function()
            local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
            esp(v, color)
        end)
        
        esp(v, color)
    end
end

while task.wait() do
    for i, v in pairs(highlights) do
        local color = _G.UseTeamColor and i.TeamColor.Color or ((plr.TeamColor == i.TeamColor) and _G.FriendColor or _G.EnemyColor)
        v.FillColor = color
    end
end
end)

tab1.newButton("工具点击传送", " ", function()
    mouse = game.Players.LocalPlayer:GetMouse()
                tool = Instance.new("Tool")
                tool.RequiresHandle = false
                tool.Name = "点击传送"
                tool.Activated:connect(function()
                local pos = mouse.Hit+Vector3.new(0,2.5,0)
                pos = CFrame.new(pos.X,pos.Y,pos.Z)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
                end)
                tool.Parent = game.Players.LocalPlayer.Backpack
end)

tab1.newButton("工具包", "玩家应该看不见", function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
end)

tab1.newButton("键盘脚本", "这是电脑版的键盘", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
end)

tab1.newToggle("夜视", " ", true, function(Value)
        if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
end)

tab1.newToggle("自动跳跳", " ", true, function(s)
getgenv().InfJ = s
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfJ == true then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
end)

tab1.newInput("跳跃", "打您的输入。", function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

tab1.newInput("速度", "打您的输入。", function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

tab1.newInput("重力", "打您的输入。", function(Value)
    game.Workspace.Gravity = Value
end)

tab1.newInput("血量", "打您的输入。", function(Value)
    game.Players.LocalPlayer.Character.Humanoid.Health = Value
end)

local tab2 = DrRayLibrary.newTab("脚本汉化版游戏", "ImageIdLogoHere")

tab2.newButton("被遗弃", " ", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/OWOWOWWOW/HTT/main/HT.lua")()
end)

tab2.newButton("死铁轨", " ", function()
    script_key="PASTEKEYHERE"; (loadstring or load)(game:HttpGet("https://getnative.cc/script/loader"))()
end)

tab2.newButton("脚本中心", "", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\88\75\46\84\88\84\34\41\41\40\41\10")()
end)

tab2.newButton("活过七天", "自动拾取废铁", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-7-days-to-live-37689"))()
end)

tab2.newButton("活过七天", "自动装弹砍树夜视", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/7-Days-To-Live-Bhfhd-38003"))()
end)

tab2.newButton("导管中心", "缝合脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/useranewrff/roblox/main/%E6%9D%A1%E6%AC%BE%E5%8D%8F%E8%AE%AE.lua"))()
end)

tab2.newButton("情云脚本", "", function()
    loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
end)

tab2.newButton("苏脚本", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kukunb/kukulol/refs/heads/main/SUscript.txt"))();
end)

tab2.newButton("死铁轨", "无卡密刷债券", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-Hung-Hub-Auto-Farm-Bonds-No-Key-40315"))()
end)

tab2.newButton("Doors", "汉化", function()
    --[[Doors Blackking And BobHub脚本汉化]]loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
end)

tab2.newButton("NN中心", "", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\100\104\100\98\120\117\98\47\110\110\115\105\101\106\119\47\109\97\105\110\47\71\85\73\89\68\83\83\46\108\117\97\34\41\41\40\41\10")()
end)

tab2.newButton("XK中心", "", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\88\75\46\84\88\84\34\41\41\40\41\10")()
end)

tab2.newButton("即将推出", "即将推出", function()
    print('Hello!')
end)

tab2.newButton("即将推出", "即将推出", function()
    print('Hello!')
end)

local tab3 = DrRayLibrary.newTab("大型脚本中心","ImageIdHere")

tab3.newButton("即将推出", "即将推出", function()
    print('Hello!')
end)

tab3.newButton("即将推出", "即将推出", function()
    print('Hello!')
end)

tab3.newButton("即将推出", "即将推出", function()
    print('Hello!')
end)

local tab4 = DrRayLibrary.newTab("关于", "ImageIdHere")

tab4.newLabe1("作者消逝（山）")
tab4.newLabe1("QQ群1054212823")
tab4.newLabe1("当前版本v1.0.01")
tab4.newLabe1("此脚本免费不可缺钱")
--[[
tab2.newLabe1("Hello, this is Tab 2.")
tab2.newButton("Button", "Prints Hello!", function()
    print('Hello!')
end)
tab2.newToggle("Toggle", "Toggle! (prints the state)", true, function(toggleState)
    if toggleState then
        print("On")
    else
        print("Off")
    end
end)
tab2.newDropdown("Dropdown", "Select one of these options!", {"water", "dog", "air", "bb", "airplane", "wohhho", "yeay", "delete"}, function(selectedOption)
    print(selectedOption)
end)
]]
