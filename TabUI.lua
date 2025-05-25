-- TabUI.lua
local TabUI = {}

function TabUI:Create(parentFrame, tabNames, onTabSelected)
	local tabBar = Instance.new("Frame")
	tabBar.Name = "TabBar"
	tabBar.Size = UDim2.new(1, -20, 0, 35)
	tabBar.Position = UDim2.new(0, 10, 0, 50)
	tabBar.BackgroundTransparency = 1
	tabBar.Parent = parentFrame

	local buttons = {}

	local spacing = 10
	local totalWidth = (#tabNames * 100) + ((#tabNames - 1) * spacing)
	local startX = (tabBar.AbsoluteSize.X - totalWidth) / 2

	for i, name in ipairs(tabNames) do
		local button = Instance.new("TextButton")
		button.Name = name
		button.Text = name
		button.Font = Enum.Font.Gotham
		button.TextSize = 16
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.Size = UDim2.new(0, 100, 0, 30)
		button.Position = UDim2.new(0, (i - 1) * 110, 0, 0)
		button.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		button.BorderSizePixel = 0
		button.AutoButtonColor = false
		button.Parent = tabBar

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 6)
		corner.Parent = button

		local stroke = Instance.new("UIStroke")
		stroke.Color = Color3.fromRGB(255, 255, 255)
		stroke.Thickness = 1
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Parent = button

		button.MouseButton1Click:Connect(function()
			for _, btn in pairs(buttons) do
				btn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
			end
			button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

			if onTabSelected then
				onTabSelected(name)
			end
		end)

		table.insert(buttons, button)
	end

	return tabBar
end

return TabUI
