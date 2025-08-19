-- EZ keys V0.1

-- Gui to Lua
-- Version: 3.2
game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "山";
	Text = "卡密加群获取";
	Icon = "rbxthumb://type=Asset&id=17245602801&w=150&h=150";
Duration = 15})
-- the stuff for preperation
local key = "山" -- put youre key in here

local keylink = "群号1054212823" -- put your key link here

local nameofthescript = "山" --put your script name here. leave blank too leave blank ig

local whoisitmadeby = "扫橘子皮" -- put your name here

local thenoteofthekey = "群号1054212823" --note you add here. leave blank to not have a note.


-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local KeySystem = Instance.new("Frame")
local KeyTextbox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local scriptname = Instance.new("TextLabel")
local madeby = Instance.new("TextLabel")
local note = Instance.new("TextLabel")
--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

KeySystem.Name = "KeySystem"
KeySystem.Parent = ScreenGui
KeySystem.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
KeySystem.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeySystem.BorderSizePixel = 0
KeySystem.Position = UDim2.new(0.379651636, 0, 0.32965821, 0)
KeySystem.Size = UDim2.new(0.240300864, 0, 0.540683579, 0)
KeySystem.Selectable = true
KeySystem.Active = true
KeySystem.Draggable = true

KeyTextbox.Name = "KeyTextbox"
KeyTextbox.Parent = KeySystem
KeyTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeyTextbox.BackgroundTransparency = 0.950
KeyTextbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeyTextbox.BorderSizePixel = 0
KeyTextbox.Position = UDim2.new(0.0939044505, 0, 0.734627843, 0)
KeyTextbox.Size = UDim2.new(0.813838542, 0, 0.161812291, 0)
KeyTextbox.Font = Enum.Font.Gotham
KeyTextbox.Text = "点这输入卡密"
KeyTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextbox.TextScaled = true
KeyTextbox.TextSize = 14.000
KeyTextbox.TextWrapped = true

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = KeyTextbox

UICorner_2.CornerRadius = UDim.new(0, 15)
UICorner_2.Parent = KeySystem

title.Name = "title"
title.Parent = KeySystem
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Position = UDim2.new(0, 0, 0.0323624611, 0)
title.Size = UDim2.new(1, 0, 0.197411001, 0)
title.Font = Enum.Font.Gotham
title.Text = "山卡密验证"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true

TextButton.Parent = KeySystem
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 0.950
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0922570005, 0, 0.504854381, 0)
TextButton.Size = UDim2.new(0.813838542, 0, 0.161812291, 0)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "确定"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.MouseButton1Click:Connect(function()
	if KeyTextbox.Text == key then
		TextButton.Text = "正确!"
		task.wait(2)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/qazwsx123wer/owo/refs/heads/main/%E5%B1%B1.lua"))() -- insert script on this line
		ScreenGui:Destroy()
	else
		TextButton.Text = "错误的卡密!"
		task.wait(2)
		TextButton.Text = "确定"
	end
	if KeyTextbox.Text == key then
	    
    elseif KeyTextbox.Text == "ilove78" then
       TextButton.Text = "该卡密已过期，加群获得最新卡密😘!"
		task.wait(4)
		TextButton.Text = "确定"
	elseif KeyTextbox.Text == "91vip" then
       TextButton.Text = "该卡密已过期，加群获得最新卡密😘!"
		task.wait(4)
		TextButton.Text = "确定"
	elseif KeyTextbox.Text == "9178114514" then
       TextButton.Text = "该卡密已过期，加群获得最新卡密😘!"
		task.wait(4)
		TextButton.Text = "确定"
	elseif KeyTextbox.Text == "xiaoai" then
       TextButton.Text = "该卡密已过期，加群获得最新卡密😘!"
		task.wait(4)
		TextButton.Text = "确定"
	elseif KeyTextbox.Text == "dajibaccb" then
       TextButton.Text = "该卡密已过期，加群获得最新卡密😘!"
		task.wait(4)
		TextButton.Text = "确定"
	elseif KeyTextbox.Text == "iamgay" then
       TextButton.Text = "该卡密已过期，加群获得最新卡密😘!"
		task.wait(4)
		TextButton.Text = "确定"
	end
end)

UICorner_3.CornerRadius = UDim.new(0, 15)
UICorner_3.Parent = TextButton

scriptname.Name = "scriptname"
scriptname.Parent = KeySystem
scriptname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptname.BackgroundTransparency = 1.000
scriptname.BorderColor3 = Color3.fromRGB(0, 0, 0)
scriptname.BorderSizePixel = 0
scriptname.Position = UDim2.new(0, 0, 0.262135923, 0)
scriptname.Size = UDim2.new(1, 0, 0.0809061453, 0)
scriptname.Font = Enum.Font.Gotham
scriptname.Text = nameofthescript
scriptname.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptname.TextScaled = true
scriptname.TextSize = 14.000
scriptname.TextWrapped = true

madeby.Name = "madeby"
madeby.Parent = KeySystem
madeby.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
madeby.BackgroundTransparency = 1.000
madeby.BorderColor3 = Color3.fromRGB(0, 0, 0)
madeby.BorderSizePixel = 0
madeby.Position = UDim2.new(0, 0, 0.368932039, 0)
madeby.Size = UDim2.new(1, 0, 0.0809061453, 0)
madeby.Font = Enum.Font.Gotham
madeby.Text = "Made by: " .. whoisitmadeby
madeby.TextColor3 = Color3.fromRGB(255, 255, 255)
madeby.TextScaled = true
madeby.TextSize = 14.000
madeby.TextWrapped = true
madeby.Visible = true

note.Name = "note"
note.Parent = KeySystem
note.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
note.BackgroundTransparency = 1.000
note.BorderColor3 = Color3.fromRGB(0, 0, 0)
note.BorderSizePixel = 0
note.Position = UDim2.new(0, 0, 0.919093847, 0)
note.Size = UDim2.new(1, 0, 0.0809061453, 0)
note.Font = Enum.Font.Gotham
note.Text = thenoteofthekey
note.TextColor3 = Color3.fromRGB(255, 255, 255)
note.TextScaled = true
note.TextSize = 14.000
note.TextWrapped = true

--scriptname.Text = "群号已复制!进群获取!"
--setclipboard(keylink)
--task.wait(5)
