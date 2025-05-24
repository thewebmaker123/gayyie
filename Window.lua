-- WindowUI.lua
local WindowUI = {}

function WindowUI:Create(windowTitle)
	local player = game:GetService("Players").LocalPlayer
	local gui = Instance.new("ScreenGui")
	gui.Name = "WindowUI"
	gui.ResetOnSpawn = false
	gui.Parent = player:WaitForChild("PlayerGui")

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 475, 0, 220)
	frame.Position = UDim2.new(0.5, -237, 0.5, -110)
	frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	frame.BorderSizePixel = 0
	frame.BackgroundTransparency = 1 -- for fade-in
	frame.Parent = gui

	local uicorner = Instance.new("UICorner")
	uicorner.CornerRadius = UDim.new(0, 6)
	uicorner.Parent = frame

	local title = Instance.new("TextLabel")
	title.Text = windowTitle or "Window Title"
	title.Font = Enum.Font.GothamSemibold
	title.TextSize = 24
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, -20, 0, 30)
	title.Position = UDim2.new(0, 10, 0, 10)
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextTransparency = 1 -- fade-in
	title.Parent = frame

	local version = Instance.new("TextLabel")
	version.Text = "V1.00"
	version.Font = Enum.Font.Gotham
	version.TextSize = 14
	version.TextColor3 = Color3.fromRGB(160, 160, 160)
	version.BackgroundTransparency = 1
	version.Size = UDim2.new(0, 80, 0, 20)
	version.Position = UDim2.new(1, -85, 1, -25)
	version.TextXAlignment = Enum.TextXAlignment.Right
	version.TextTransparency = 1 -- fade-in
	version.Parent = frame

	-- Fade-in animation
	coroutine.wrap(function()
		for t = 1, 0, -0.05 do
			frame.BackgroundTransparency = t
			title.TextTransparency = t
			version.TextTransparency = t
			wait(0.03)
		end
	end)()

	return frame
end

return WindowUI
