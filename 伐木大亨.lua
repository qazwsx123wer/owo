local SimpleUI = {}
SimpleUI.__index = SimpleUI

-- 样式配置（统一管理颜色、字体和尺寸）
local Styles = {
    Colors = {
        Primary = Color3.fromRGB(59, 130, 246),       -- 主色调（蓝色）
        PrimaryHover = Color3.fromRGB(96, 165, 250),  -- 悬停色
        PrimaryPress = Color3.fromRGB(37, 99, 235),   -- 点击色
        Text = Color3.fromRGB(30, 41, 59),            -- 文本色
        TextLight = Color3.fromRGB(255, 255, 255),    -- 浅色文本
        StatusSuccess = Color3.fromRGB(16, 185, 129), -- 成功状态色
        Background = Color3.fromRGB(248, 250, 252),   -- 背景色
        Border = Color3.fromRGB(226, 232, 240),       -- 边框色
        Toggle = Color3.fromRGB(239, 68, 68)          -- 开关按钮色
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
        ToggleSize = 50,  -- 开关按钮大小
        ContainerWidth = 360,
        ContainerHeight = 300
    }
}

-- 初始化UI实例
function SimpleUI.new()
    local self = setmetatable({}, SimpleUI)
    
    -- 创建主屏幕容器
    self.screenGui = Instance.new("ScreenGui")
    self.screenGui.Name = "MergedUI"
    self.screenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
    self.isOpen = false  -- UI初始状态：关闭
    
    -- 添加手机开关按钮（悬浮在右侧）
    self.toggleButton = Instance.new("TextButton")
    self.toggleButton.Name = "ToggleButton"
    self.toggleButton.Position = UDim2.new(1, -Styles.Sizes.ToggleSize - 10, 0.5, -Styles.Sizes.ToggleSize/2)
    self.toggleButton.Size = UDim2.new(0, Styles.Sizes.ToggleSize, 0, Styles.Sizes.ToggleSize)
    self.toggleButton.BackgroundColor3 = Styles.Colors.Toggle
    self.toggleButton.Text = "≡"  -- 菜单图标
    self.toggleButton.TextColor3 = Styles.Colors.TextLight
    self.toggleButton.TextSize = 24
    self.toggleButton.CornerRadius = UDim.new(0, Styles.Sizes.ToggleSize/2)  -- 圆形按钮
    self.toggleButton.Shadow = Instance.new("Shadow")
    self.toggleButton.Shadow.Parent = self.toggleButton
    self.toggleButton.Parent = self.screenGui
    
    -- 创建主UI面板（初始隐藏）
    self.container = Instance.new("Frame")
    self.container.Name = "Container"
    self.container.Position = UDim2.new(0.5, -Styles.Sizes.ContainerWidth/2, 0.5, -Styles.Sizes.ContainerHeight/2)
    self.container.Size = UDim2.new(0, Styles.Sizes.ContainerWidth, 0, Styles.Sizes.ContainerHeight)
    self.container.BackgroundColor3 = Styles.Colors.Background
    self.container.BorderColor3 = Styles.Colors.Border
    self.container.BorderSizePixel = 1
    self.container.CornerRadius = UDim.new(0, Styles.Sizes.BorderRadius)
    self.container.Shadow = Instance.new("Shadow")
    self.container.Shadow.Parent = self.container
    self.container.Visible = false  -- 初始隐藏
    self.container.Parent = self.screenGui
    
    self.elements = {}
    self:setupToggleLogic()  -- 绑定开关逻辑
    return self
end

-- 开关按钮逻辑
function SimpleUI:setupToggleLogic()
    local function toggleUI()
        self.isOpen = not self.isOpen
        self.container.Visible = self.isOpen
        -- 切换按钮图标和颜色
        self.toggleButton.Text = self.isOpen and "✕" or "≡"
        self.toggleButton.BackgroundColor3 = self.isOpen and Styles.Colors.StatusSuccess or Styles.Colors.Toggle
    end
    
    -- 开关按钮交互效果
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

-- 添加标题文本
function SimpleUI:addTitle(text)
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Position = UDim2.new(0, Styles.Sizes.Padding, 0, Styles.Sizes.Padding)
    title.Size = UDim2.new(1, -Styles.Sizes.Padding*2, 0, 40)
    title.BackgroundTransparency = 1
    title.Text = text or "极简UI示例"
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
    status.Text = "等待操作..."
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
    button.Text = props.text or "点击按钮"
    button.TextColor3 = Styles.Colors.TextLight
    button.TextFont = Styles.Fonts.Button
    button.TextSize = Styles.Sizes.Button
    button.CornerRadius = UDim.new(0, Styles.Sizes.BorderRadius)
    button.AutoButtonColor = false
    button.Parent = self.container
    table.insert(self.elements, button)

    -- 按钮颜色过渡动画
    local function tweenColor(target, color)
        for i = 1, 10 do
            button.BackgroundColor3 = button.BackgroundColor3:Lerp(color, 0.3)
            task.wait(0.01)
        end
    end

    -- 绑定按钮交互事件
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
    desc.Text = text or "这是一个整合了基础UI和手机开关功能的示例面板。"
    desc.TextColor3 = Styles.Colors.Text
    desc.TextFont = Styles.Fonts.Body
    desc.TextSize = Styles.Sizes.Body
    desc.TextWrapped = true  -- 自动换行
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.TextYAlignment = Enum.TextYAlignment.Top
    desc.Parent = self.container
    table.insert(self.elements, desc)
    return desc
end

-- 清理UI元素
function SimpleUI:destroy()
    self.screenGui:Destroy()
end

-- 初始化UI并添加元素
local ui = SimpleUI.new()
ui:addTitle("整合版极简UI")
ui:addDescription("这个UI包含基础交互功能和手机适配的开关按钮，点击右侧按钮可显示/隐藏面板。")
ui:addStatusLabel()
ui:addButton({
    text = "执行操作",
    onClick = function()
        ui.statusLabel.Text = "✅ 操作成功！"
        ui.statusLabel.TextColor3 = Styles.Colors.StatusSuccess
        -- 3秒后恢复状态
        task.delay(3, function()
            ui.statusLabel.Text = "等待操作..."
            ui.statusLabel.TextColor3 = Styles.Colors.Text
        end)
    end
})

print("整合版UI已加载完成")
