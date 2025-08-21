local ui = {
    -- 按钮属性
    button = {
        x = 150,
        y = 200,
        width = 200,
        height = 50,
        text = "点击我",
        color = {0.2, 0.6, 1},       -- 正常颜色（蓝）
        hoverColor = {0.3, 0.7, 1},  -- 悬停颜色
        pressColor = {0.1, 0.5, 0.9},-- 点击颜色
        isHovered = false,
        isPressed = false
    },
    -- 文本标签
    label = {
        text = "极简 Lua UI 示例",
        x = 150,
        y = 100,
        color = {0.1, 0.1, 0.1}      -- 深灰色
    },
    -- 交互状态文本
    statusText = "等待操作...",
    statusY = 300
}

-- 初始化函数
function love.load()
    love.window.setTitle("极简 Lua UI")
    love.window.setMode(500, 400)  -- 设置窗口大小
end

-- 更新逻辑
function love.update(dt)
    -- 检测鼠标是否悬停在按钮上
    local mx, my = love.mouse.getPosition()
    ui.button.isHovered = 
        mx >= ui.button.x and mx <= ui.button.x + ui.button.width and
        my >= ui.button.y and my <= ui.button.y + ui.button.height
end

-- 绘制 UI
function love.draw()
    -- 绘制标题文本
    love.graphics.setColor(ui.label.color)
    love.graphics.setFont(love.graphics.newFont(20))
    love.graphics.print(ui.label.text, ui.label.x, ui.label.y)

    -- 绘制按钮（根据状态切换颜色）
    if ui.button.isPressed then
        love.graphics.setColor(ui.button.pressColor)
    elseif ui.button.isHovered then
        love.graphics.setColor(ui.button.hoverColor)
    else
        love.graphics.setColor(ui.button.color)
    end
    love.graphics.rectangle("fill", ui.button.x, ui.button.y, ui.button.width, ui.button.height, 8)  -- 圆角矩形

    -- 绘制按钮文本
    love.graphics.setColor(1, 1, 1)  -- 白色文本
    love.graphics.setFont(love.graphics.newFont(16))
    local textWidth = love.graphics.getFont():getWidth(ui.button.text)
    local textX = ui.button.x + (ui.button.width - textWidth) / 2  -- 文本居中
    local textY = ui.button.y + (ui.button.height - 20) / 2
    love.graphics.print(ui.button.text, textX, textY)

    -- 绘制状态文本
    love.graphics.setColor(0.5, 0.2, 0.2)  -- 暗红色
    love.graphics.setFont(love.graphics.newFont(14))
    love.graphics.print(ui.statusText, ui.label.x, ui.statusY)
end

-- 鼠标按下事件
function love.mousepressed(x, y, button)
    if button == 1 and ui.button.isHovered then  -- 左键点击
        ui.button.isPressed = true
        ui.statusText = "按钮被点击！"
    end
end

-- 鼠标释放事件
function love.mousereleased(x, y, button)
    if button == 1 then
        ui.button.isPressed = false
    end
end

-- 键盘事件（按 ESC 退出）
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
