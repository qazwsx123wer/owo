local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local SafeCall = function(f) pcall(f) end

RunService.Heartbeat:Connect(function()SafeCall(function()
    local gui = LocalPlayer.PlayerGui:FindFirstChild("MainGui")
    local fishUi = gui and gui:FindFirstChild("Fishing")
    if not fishUi or not fishUi.Visible then return end
    local bar = fishUi.BarFrame:FindFirstChild("Bar")
    if not bar then return end
    local s = bar.Position.X.Scale
    if s < 0.85 or s > 0.85 then
        bar:TweenPosition(UDim2.new(0.5,0,0.5,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0.04,true)
    end
end)end)

RunService.Heartbeat:Connect(function()SafeCall(function()
    local gui = LocalPlayer.PlayerGui:FindFirstChild("MainGui")
    local fishUi = gui and gui:FindFirstChild("Fishing")
    if not fishUi then return end
    local trash = fishUi:FindFirstChild("TrashCan")
    if not trash then return end

    local slam = trash.Slam and trash.Slam.Button
    if slam and slam.Line.Size.X.Scale < 1.1 then
        task.wait(0)
        slam.MouseButton1Click:Fire()
    end

    local charge = trash.Charge and trash.Charge.Button
    if charge then charge.MouseButton1Click:Fire() end
end)end)

