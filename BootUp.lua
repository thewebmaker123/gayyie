-- BootupUI.lua (Save this as a ModuleScript or upload it to a host like Gist)
local BootupUI = {}

function BootupUI:Create(titleText, subtitleText)
	local player = game:GetService("Players").LocalPlayer
	local gui = Instance.new("ScreenGui")
	gui.Name = "BootupUI"
	gui.ResetOnSpawn = false
	gui.Parent = player:WaitForChild("PlayerGui")

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 475, 0, 220)
	frame.Position = UDim2.new(0.5, -237, 0.5, -110)
	frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22) -- Rayfield-like background
	frame.BorderSizePixel = 0
	frame.Parent = gui

	local uicorner = Instance.new("UICorner")
	uicorner.CornerRadius = UDim.new(0, 6)
	uicorner.Parent = frame

	local title = Instance.new("TextLabel")
	title.Text = titleText or "Loading UI"
	title.Font = Enum.Font.GothamSemibold -- Substitute for Ancizar Sans
	title.TextSize = 24
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1
	title.Size = UDim2.new(1, -20, 0, 30)
	title.Position = UDim2.new(0, 10, 0, 10)
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Parent = frame

	local subtitle = Instance.new("TextLabel")
	subtitle.Text = subtitleText or "Preparing..."
	subtitle.Font = Enum.Font.Gotham
	subtitle.TextSize = 18
	subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
	subtitle.BackgroundTransparency = 1
	subtitle.Size = UDim2.new(1, -20, 0, 24)
	subtitle.Position = UDim2.new(0, 10, 0, 45)
	subtitle.TextXAlignment = Enum.TextXAlignment.Left
	subtitle.Parent = frame

	local percent = Instance.new("TextLabel")
	percent.Name = "Percentage"
	percent.Text = "0%"
	percent.Font = Enum.Font.GothamBold
	percent.TextSize = 30
	percent.TextColor3 = Color3.fromRGB(255, 255, 255)
	percent.BackgroundTransparency = 1
	percent.Size = UDim2.new(1, 0, 0, 40)
	percent.Position = UDim2.new(0, 0, 1, -50)
	percent.TextXAlignment = Enum.TextXAlignment.Center
	percent.TextYAlignment = Enum.TextYAlignment.Center
	percent.Parent = frame

	-- Simulate loading
	coroutine.wrap(function()
		for i = 0, 100, 1 do
			percent.Text = i .. "%"
			wait(0.025)
		end
	end)()

	return gui
end

return BootupUI
