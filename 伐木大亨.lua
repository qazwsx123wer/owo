lua
  
local SimpleUI = {}
SimpleUI.__index = SimpleUI

-- Style configuration (unified management of colors, fonts, and sizes)
local Styles = {
    Colors = {
        Primary = Color3.fromRGB(59, 130, 246),       -- Main color (blue)
        PrimaryHover = Color3.fromRGB(96, 165, 250),  -- Hover color
        PrimaryPress = Color3.fromRGB(37, 99, 235),   -- Press color
        Text = Color3.fromRGB(30, 41, 59),            -- Text color
        TextLight = Color3.fromRGB(255, 255, 255),    -- Light text color
        StatusSuccess = Color3.fromRGB(16, 185, 129), -- Success status color
        Background = Color3.fromRGB(248, 250, 252),   -- Background color
        Border = Color3.fromRGB(226, 232, 240),       -- Border color
        Toggle = Color3.fromRGB(239, 68, 68)          -- Toggle button color
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
        ToggleSize = 50,  -- Toggle button size
        ContainerWidth = 360,
        ContainerHeight = 300
    }
}

-- Initialize UI instance
function SimpleUI.new()
    local self = setmetatable({}, SimpleUI)
    
    -- Create main screen container
    self.screenGui = Instance.new("ScreenGui")
    self.screenGui.Name = "MergedUI"
    self.screenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
    self.isOpen = false  -- UI initial state: closed
    
    -- Add mobile toggle button (floating on the right)
    self.toggleButton = Instance.new("TextButton")
    self.toggleButton.Name = "ToggleButton"
    self.toggleButton.Position = UDim2.new(1, -Styles.Sizes.ToggleSize - 10, 0.5, -Styles.Sizes.ToggleSize/2)
    self.toggleButton.Size = UDim2.new(0, Styles.Sizes.ToggleSize, 0, Styles.Sizes.ToggleSize)
    self.toggleButton.BackgroundColor3 = Styles.Colors.Toggle
    self.toggleButton.Text = "≡"  -- Menu icon
    self.toggleButton.TextColor3 = Styles.Colors.TextLight
    self.toggleButton.TextSize = 24
    self.toggleButton.CornerRadius = UDim.new(0, Styles.Sizes.ToggleSize/2)  -- Round button
    self.toggleButton.Shadow = Instance.new("Shadow")
    self.toggleButton.Shadow.Parent = self.toggleButton
    self.toggleButton.Parent = self.screenGui
    
    -- Create main UI panel (initially hidden)
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
    self.container.Visible = false  -- Initially hidden
    self.container.Parent = self.screenGui
    
    self.elements = {}
    self:setupToggleLogic()  -- Bind toggle logic
    return self
end

-- Toggle button logic
function SimpleUI:setupToggleLogic()
    local function toggleUI()
        self.isOpen = not self.isOpen
        self.container.Visible = self.isOpen
        -- Switch button icon and color
        self.toggleButton.Text = self.isOpen and "✕" or "≡"
        self.toggleButton.BackgroundColor3 = self.isOpen and Styles.Colors.StatusSuccess or Styles.Colors.Toggle
    end
    
    -- Toggle button interaction effects
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

-- Add title text
function SimpleUI:addTitle(text)
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Position = UDim2.new(0, Styles.Sizes.Padding, 0, Styles.Sizes.Padding)
    title.Size = UDim2.new(1, -Styles.Sizes.Padding*2, 0, 40)
    title.BackgroundTransparency = 1
    title.Text = text or "Simple UI Example"
    title.TextColor3 = Styles.Colors.Text
    title.TextFont = Styles.Fonts.Title
    title.TextSize = Styles.Sizes.Title
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = self.container
    table.insert(self.elements, title)
    return title
end

-- Add status text
function SimpleUI:addStatusLabel()
    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Position = UDim2.new(0, Styles.Sizes.Padding, 1, -Styles.Sizes.Padding - 30)
    status.Size = UDim2.new(1, -Styles.Sizes.Padding*2, 0, 30)
    status.BackgroundTransparency = 1
    status.Text = "Waiting for action..."
    status.TextColor3 = Styles.Colors.Text
    status.TextFont = Styles.Fonts.Body
    status.TextSize = Styles.Sizes.Body
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.Parent = self.container
    table.insert(self.elements, status)
    self.statusLabel = status
    return status
end

-- Add interactive button
function SimpleUI:addButton(props)
    local button = Instance.new("TextButton")
    button.Name = props.name or "Button"
    button.Position = props.position or UDim2.new(0.5, -100, 0.6, 0)
    button.Size = UDim2.new(0, 200, 0, 50)
    button.BackgroundColor3 = Styles.Colors.Primary
    button.Text = props.text or "Click Button"
    button.TextColor3 = Styles.Colors.TextLight
    button.TextFont = Styles.Fonts.Button
    button.TextSize = Styles.Sizes.Button
    button.CornerRadius = UDim.new(0, Styles.Sizes.BorderRadius)
    button.AutoButtonColor = false
    button.Parent = self.container
    table.insert(self.elements, button)

    -- Button color transition animation
    local function tweenColor(target, color)
        for i = 1, 10 do
            button.BackgroundColor3 = button.BackgroundColor3:Lerp(color, 0.3)
            task.wait(0.01)
        end
    end

    -- Bind button interaction events
    button.MouseEnter:Connect(function() tweenColor(button, Styles.Colors.PrimaryHover) end)
    button.MouseLeave:Connect(function() tweenColor(button, Styles.Colors.Primary) end)
    button.MouseButton1Down:Connect(function() tweenColor(button, Styles.Colors.PrimaryPress) end)
    button.MouseButton1Up:Connect(function()
        tweenColor(button, Styles.Colors.PrimaryHover)
        if props.onClick then props.onClick() end
    end)

    return button
end

-- Add description text
function SimpleUI:addDescription(text)
    local desc = Instance.new("TextLabel")
    desc.Name = "Description"
    desc.Position = UDim2.new(0, Styles.Sizes.Padding, 0, 60)
    desc.Size = UDim2.new(1, -Styles.Sizes.Padding*2, 0, 60)
    desc.BackgroundTransparency = 1
    desc.Text = text or "This is an example panel integrating basic UI and mobile toggle functions."
    desc.TextColor3 = Styles.Colors.Text
    desc.TextFont = Styles.Fonts.Body
    desc.TextSize = Styles.Sizes.Body
    desc.TextWrapped = true  -- Auto line wrap
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.TextYAlignment = Enum.TextYAlignment.Top
    desc.Parent = self.container
    table.insert(self.elements, desc)
    return desc
end

-- Clean up UI elements
function SimpleUI:destroy()
    self.screenGui:Destroy()
end

-- Initialize UI and add elements
local ui = SimpleUI.new()
ui:addTitle("Integrated Simple UI")
ui:addDescription("This UI includes basic interaction functions and mobile-adapted toggle buttons. Click the right button to show/hide the panel.")
ui:addStatusLabel()
ui:addButton({
    text = "Execute Action",
    onClick = function()
        ui.statusLabel.Text = "✅ Action successful!"
        ui.statusLabel.TextColor3 = Styles.Colors.StatusSuccess
        -- Restore status after 3 seconds
        task.delay(3, function()
            ui.statusLabel.Text = "Waiting for action..."
            ui.statusLabel.TextColor3 = Styles.Colors.Text
        end)
    end
})

print("Integrated UI loaded successfully")
