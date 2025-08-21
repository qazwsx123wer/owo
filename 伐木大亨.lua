lua
  
local SimpleUI = {}
SimpleUI.__index = SimpleUI

-- 样式配置
local Styles = {
    Colors = {
        Primary = Color3.fromRGB(59, 130, 246),
        PrimaryHover = Color3.fromRGB(96, 165, 250),
        PrimaryPress = Color3.fromRGB(37, 99, 235),
        Text = Color3.fromRGB(30, 41, 59),
        TextLight = Color3.fromRGB(255, 255, 255),
        StatusSuccess = Color3.fromRGB(16, 185, 129),
        Background = Color3.fromRGB(248, 250, 252),
        Border = Color3.fromRGB(226, 232, 240),
        Toggle = Color3.fromRGB(239, 68, 68)
    },
    Fonts = {
        Title = Enum.Font.GothamBold,
        Body = Enum.Font.Gotham,
        Button = Enum.Font.GothamMedium
    },
    Sizes = {
        Title = 24,
        Body = 16,
        Button = 18,
        BorderRadius = 8,
        Padding = 12,
        ToggleSize = 50
    }
}

-- 初始化UI
function SimpleUI.new()
    local self = setmetatable({}, SimpleUI)
    
    -- 主容器
    self.screenGui = Instance.new("ScreenGui")
    self.screenGui.Name = "IntegratedUI"
    self.screenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
    self.isOpen = false
    
    -- 开关按钮
    self.toggleButton = Instance.new("TextButton")
    self.toggleButton.Name = "ToggleButton"
    self.toggleButton.Position = UDim2.new(1, -Styles.Sizes.ToggleSize - 10, 0.5, -Styles.Sizes.ToggleSize/2)
    self.toggleButton.Size = UDim2.new(0, Styles.Sizes.ToggleSize, 0, Styles.Sizes.ToggleSize)
    self.toggleButton.BackgroundColor3 = Styles.Colors.Toggle
    self.toggleButton.Text = "≡"
    self.toggleButton.TextColor3 = Styles.Colors.TextLight
    self.toggleButton.TextSize = 24
    self.toggleButton.CornerRadius = UDim.new(0, Styles.Sizes.ToggleSize/2)
    self.toggleButton.Shadow = Instance.new("Shadow")
    self.toggleButton.Shadow.Parent = self.toggleButton
    self.toggleButton.Parent = self.screenGui
    
    -- 主UI面板
    self.container = Instance.new("Frame")
    self.container.Name = "Container"
    self.container.Position = UDim2.new(0.5, -180, 0.5, -150)
    self.container.Size = UDim2.new(0, 360, 0, 300)
    self.container.BackgroundColor3 = Styles.Colors.Background
    self.container.BorderColor3 = Styles.Colors.Border
    self.container.BorderSizePixel = 1
    self.container.CornerRadius = UDim.new(0, Styles.Sizes.BorderRadius)
    self.container.Shadow = Instance.new("Shadow")
    self.container.Shadow.Parent = self.container
    self.container.Visible = false
    self.container.Parent = self.screenGui
    
    self.elements = {}
    self:setupToggleLogic()
    return self
end

-- 开关逻辑
function SimpleUI:setupToggleLogic()
    local function toggleUI()
        self.isOpen = not self.isOpen
        self.container.Visible = self.isOpen
        self.toggleButton.Text = self.isOpen and "✕" or "≡"
        self.toggleButton.BackgroundColor3 = self.isOpen and Styles.Colors.StatusSuccess or Styles.Colors.Toggle
    end
    
    self.toggleButton.MouseEnter:Connect(function()
        self.toggleButton.BackgroundColor3 = self.isOpen 
            and Styles.Colors.StatusSuccess:Lerp(Color3.new(1,1,1), 0.2)
            or Styles.Colors.Toggle:Lerp(Color3.new(1,1,1), 0.2)
    end)
    self.toggleButton.MouseLeave:Connect(function()
        self.toggleButton.BackgroundColor3 = self.isOpen 
            and Styles.Colors.StatusSuccess
            or Styles.Colors.Toggle
    end)
    self.toggleButton.MouseButton1Click:Connect(toggleUI)
end

-- 添加标题
function SimpleUI:addTitle(text)
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Position = UDim2.new(0, Styles.Sizes.Padding, 0, Styles.Sizes.Padding)
    title.Size = UDim2.new(1, -Styles.Sizes.Padding*2, 0, 40)
    title.BackgroundTransparency = 1
    title.Text = text or "UI Title"
    title.TextColor3 = Styles.Colors.Text
    title.TextFont = Styles.Fonts.Title
    title.TextSize = Styles.Sizes.Title
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = self.container
    table.insert(self.elements, title)
    return title
end

-- 添加状态文本
function SimpleUI:addStatusLabel()
    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Position = UDim2.new(0, Styles.Sizes.Padding, 1, -Styles.Sizes.Padding - 30)
    status.Size = UDim2.new(1, -Styles.Sizes.Padding*2, 0, 30)
    status.BackgroundTransparency = 1
    status.Text = "Waiting..."
    status.TextColor3 = Styles.Colors.Text
    status.TextFont = Styles.Fonts.Body
    status.TextSize = Styles.Sizes.Body
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.Parent = self.container
    table.insert(self.elements, status)
    self.statusLabel = status
    return status
end

-- 添加交互按钮
function SimpleUI:addButton(props)
    local button = Instance.new("TextButton")
    button.Name = props.name or "Button"
    button.Position = props.position or UDim2.new(0.5, -100, 0.6, 0)
    button.Size = UDim2.new(0, 200, 0, 50)
    button.BackgroundColor3 = Styles.Colors.Primary
    button.Text = props.text or "Click"
    button.TextColor3 = Styles.Colors.TextLight
    button.TextFont = Styles.Fonts.Button
    button.TextSize = Styles.Sizes.Button
    button.CornerRadius = UDim.new(0, Styles.Sizes.BorderRadius)
    button.AutoButtonColor = false
    button.Parent = self.container
    table.insert(self.elements, button)

    -- 按钮动画
    local function tweenColor(target, color)
        for i = 1, 10 do
            button.BackgroundColor3 = button.BackgroundColor3:Lerp(color, 0.3)
            task.wait(0.01)
        end
    end

    button.MouseEnter:Connect(function() tweenColor(button, Styles.Colors.PrimaryHover) end)
    button.MouseLeave:Connect(function() tweenColor(button, Styles.Colors.Primary) end)
    button.MouseButton1Down:Connect(function() tweenColor(button, Styles.Colors.PrimaryPress) end)
    button.MouseButton1Up:Connect(function()
        tweenColor(button, Styles.Colors.PrimaryHover)
        if props.onClick then props.onClick() end
    end)

    return button
end

-- 添加描述文本
function SimpleUI:addDescription(text)
    local desc = Instance.new("TextLabel")
    desc.Name = "Description"
    desc.Position = UDim2.new(0, Styles.Sizes.Padding, 0, 60)
    desc.Size = UDim2.new(1, -Styles.Sizes.Padding*2, 0, 60)
    desc.BackgroundTransparency = 1
    desc.Text = text or "UI Description"
    desc.TextColor3 = Styles.Colors.Text
    desc.TextFont = Styles.Fonts.Body
    desc.TextSize = Styles.Sizes.Body
    desc.TextWrapped = true
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.TextYAlignment = Enum.TextYAlignment.Top
    desc.Parent = self.container
    table.insert(self.elements, desc)
    return desc
end

-- 清理UI
function SimpleUI:destroy()
    self.screenGui:Destroy()
end

-- 初始化UI实例并添加元素
local ui = SimpleUI.new()
ui:addTitle("Mobile UI")
ui:addDescription("UI Description")
ui:addStatusLabel()
ui:addButton({
    text = "Action",
    onClick = function()
        ui.statusLabel.Text = "✓ Success"
        ui.statusLabel.TextColor3 = Styles.Colors.StatusSuccess
        task.delay(3, function()
            ui.statusLabel.Text = "Waiting..."
            ui.statusLabel.TextColor3 = Styles.Colors.Text
        end)
    end
})

print("UI Loaded")
