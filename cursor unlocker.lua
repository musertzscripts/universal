local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local cursorLocked = true

UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter

local function toggleCursor()
    cursorLocked = not cursorLocked
    if cursorLocked then
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    else
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if (input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl) and not gameProcessed then
        toggleCursor()
    end
end)

RunService.RenderStepped:Connect(function()
    if cursorLocked and UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    elseif not cursorLocked and UserInputService.MouseBehavior ~= Enum.MouseBehavior.Default then
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end
end)
