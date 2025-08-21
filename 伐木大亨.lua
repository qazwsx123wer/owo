local SimpleUI = {}
SimpleUI.__index = SimpleUI

function SimpleUI.new(screen)
    local self = setmetatable({}, SimpleUI)
    self.screen = screen  -- 父容器（如 Roblox 中的 ScreenGui）
    self.elements = {}    -- 存储 UI 元素
    return self
end

function SimpleUI:addLabel(props)
    local label = Instance.new("TextLabel")
    label.Name = props.name or "Label"
    label.Position = props.position or UDim2.new(0.5, -150, 0.2, 0)
    label.Size = props.size or UDim2.new(0, 300, 0, 40)
    label.BackgroundTransparency = 1
    label.Text = props.text or "文本标签"
    label.TextColor3 = props.color or Color3.new(0, 0, 0)
    label.TextScaled = true
    label.Parent = self.screen
    table.insert(self.elements, label)
    return label
end

function SimpleUI:addButton(props)
    local button = Instance.new("TextButton")
    button.Name = props.name or "Button"
    button.Position = props.position or UDim2.new(0.5, -100, 0.5, -25)
    button.Size = props.size or UDim2.new(0, 200, 0, 50)
    button.BackgroundColor3 = props.color or Color3.new(0.2, 0.6, 1)
    button.Text = props.text or "点击按钮"
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextScaled = true
    button.BorderRadius = 8  -- 圆角效果
    button.Parent = self.screen
    table.insert(self.elements, button)

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = props.hoverColor or Color3.new(0.3, 0.7, 1)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = props.color or Color3.new(0.2, 0.6, 1)
    end)
    button.MouseButton1Click:Connect(function()
        if props.onClick then
            props.onClick()  -- 点击回调
        end
    end)

    return button
end

function SimpleUI:destroy()
    for _, element in ipairs(self.elements) do
        element:Destroy()
    end
    self.elements = {}
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SimpleUIExample"
screenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui

local ui = SimpleUI.new(screenGui)

ui:addLabel({
    text = "合法 Lua UI 示例",
    position = UDim2.new(0.5, -150, 0.1, 0),
    color = Color3.new(0.2, 0.2, 0.2)
})

local statusLabel = ui:addLabel({
    text = "等待操作...",
    position = UDim2.new(0.5, -150, 0.7, 0),
    color = Color3.new(0.5, 0.2, 0.2)
})

ui:addButton({
    text = "点击我",
    onClick = function()
        statusLabel.Text = "按钮已点击！时间: " .. os.clock()
    end
})

print("UI 已加载完成（合法场景）")
