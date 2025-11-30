local gui = Instance.new("ScreenGui")
gui.Name = "LoadingScreen"
gui.IgnoreGuiInset = true  -- Makes the GUI cover the entire screen, including over the top bar
gui.Parent = game.Players.LocalPlayer.PlayerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- White background
background.Parent = gui

-- Title label: "Steal a Brainrot 🔥"
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 420, 0, 50)
titleLabel.Position = UDim2.new(0.5, -200, 0.5, -180)  -- Positioned above "Script By HikorisLua"
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Steal a Brainrot 🔥"
titleLabel.TextColor3 = Color3.fromRGB(170, 85, 0)  -- Brown-orange color for emphasis
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextScaled = true
titleLabel.Parent = background

-- Text label with the name (black text)
local loadingLabel = Instance.new("TextLabel")
loadingLabel.Size = UDim2.new(0, 300, 0, 60)
loadingLabel.Position = UDim2.new(0.5, -150, 0.5, -120)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Script By HikorisLua"
loadingLabel.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Black text
loadingLabel.Font = Enum.Font.SourceSansSemibold
loadingLabel.TextScaled = true
loadingLabel.Parent = background

-- Warning label on the left side (first)
local leftWarning1 = Instance.new("TextLabel")
leftWarning1.Size = UDim2.new(0, 200, 0, 100)
leftWarning1.Position = UDim2.new(0, 20, 0.5, -50)  -- Positioned on the left side, centered vertically
leftWarning1.BackgroundTransparency = 1
leftWarning1.Text = "Warning ⚠️: Don’t Exit. Loading is Still in Progress..."
leftWarning1.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Red text for warning
leftWarning1.Font = Enum.Font.SourceSansLight
leftWarning1.TextScaled = true
leftWarning1.TextWrapped = true
leftWarning1.Parent = background

-- Warning label on the right side (first)
local rightWarning1 = Instance.new("TextLabel")
rightWarning1.Size = UDim2.new(0, 200, 0, 100)
rightWarning1.Position = UDim2.new(1, -220, 0.5, -50)  -- Positioned on the right side, centered vertically
rightWarning1.BackgroundTransparency = 1
rightWarning1.Text = "Warning ⚠️: Don’t Exit. Loading is Still in Progress..."
rightWarning1.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Red text for warning
rightWarning1.Font = Enum.Font.SourceSansLight
rightWarning1.TextScaled = true
rightWarning1.TextWrapped = true
rightWarning1.Parent = background

-- Warning label in the middle
local middleWarning = Instance.new("TextLabel")
middleWarning.Size = UDim2.new(0, 200, 0, 100)
middleWarning.Position = UDim2.new(0.5, -100, 0.5, -50)  -- Positioned in the center of the screen
middleWarning.BackgroundTransparency = 1
middleWarning.Text = "Leaving Early may Corrupt your Game Data!"
middleWarning.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Red text for warning
middleWarning.Font = Enum.Font.SourceSansBold
middleWarning.TextScaled = true
middleWarning.TextWrapped = true
middleWarning.Parent = background

-- Rotating loading spinner (ring with gap made from scratch using multiple small circles)
local spinner = Instance.new("Frame")
spinner.Size = UDim2.new(0, 30, 0, 30)  -- Smaller size for the spinner container
spinner.Position = UDim2.new(0.5, -15, 0.5, 60)  -- Same position, adjusted anchor for centering
spinner.BackgroundTransparency = 1  -- Transparent background for the spinner container
spinner.Parent = background

-- Create 7 small circles arranged in a ring, leaving a gap (like a loading logo)
local radius = 12  -- Smaller radius for smaller ring
for i = 1, 8 do  -- Only 7 out of 8 to create the gap
	local smallCircle = Instance.new("Frame")
	smallCircle.Size = UDim2.new(0, 4, 0, 4)  -- Smaller size for each small circle
	smallCircle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black color
	smallCircle.BackgroundTransparency = 0
	smallCircle.Parent = spinner

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0.7, 0)  -- Makes it circular
	corner.Parent = smallCircle

	-- Position each small circle in a circle, skipping one for the gap
	local angle = (i - 1) * (360 / 8)  -- Divide 360 degrees by 8 positions, but only place 7
	local x = math.cos(math.rad(angle)) * radius
	local y = math.sin(math.rad(angle)) * radius
	smallCircle.Position = UDim2.new(0.5, x - 2, 0.5, y - 2)  -- Center it on the spinner, adjusted for smaller size
end

-- Loading bar at the bottom
local loadingBarBackground = Instance.new("Frame")
loadingBarBackground.Size = UDim2.new(0, 400, 0, 20)  -- Size of the loading bar background
loadingBarBackground.Position = UDim2.new(0.5, -200, 1, -50)  -- Positioned at the bottom center
loadingBarBackground.BackgroundColor3 = Color3.fromRGB(200, 200, 200)  -- Light gray background
loadingBarBackground.BackgroundTransparency = 0
loadingBarBackground.Parent = background

local loadingBarFill = Instance.new("Frame")
loadingBarFill.Size = UDim2.new(0, 0, 1, 0)  -- Starts at 0 width
loadingBarFill.Position = UDim2.new(0, 0, 0, 0)
loadingBarFill.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black fill
loadingBarFill.BackgroundTransparency = 0
loadingBarFill.Parent = loadingBarBackground

-- Add rounded corners to the loading bar
local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0.5, 0)
bgCorner.Parent = loadingBarBackground

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0.5, 0)
fillCorner.Parent = loadingBarFill

-- Text label for percentage
local percentageLabel = Instance.new("TextLabel")
percentageLabel.Size = UDim2.new(1, 0, 1, 0)
percentageLabel.Position = UDim2.new(0, 0, 0, 0)
percentageLabel.BackgroundTransparency = 1
percentageLabel.Text = "0%"
percentageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text for contrast
percentageLabel.Font = Enum.Font.SourceSansBold
percentageLabel.TextScaled = true
percentageLabel.Parent = loadingBarBackground

-- Text label above the loading bar: "Loading Assets... Don't Leave" with animated dots
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0, 400, 0, 30)
loadingText.Position = UDim2.new(0.5, -200, 1, -90)  -- Positioned above the loading bar
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading Assets... Don't Leave"
loadingText.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Black text
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextScaled = true
loadingText.Parent = background

-- Animate the dots in "Loading Assets..." sequentially
coroutine.wrap(function()
	local baseText = "Loading Assets"
	local dots = {"", ".", "..", "..."}
	local index = 1
	while true do
		loadingText.Text = baseText .. dots[index] .. "⏳"
		index = index % #dots + 1
		wait(0.5)  -- Change every 0.5 seconds
	end
end)()

-- Animate the loading bar over 30 minutes (1800 seconds)
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(1800, Enum.EasingStyle.Linear)  -- 30 minutes, linear progression
local tween = TweenService:Create(loadingBarFill, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})  -- Fill to full width
tween:Play()

-- Update percentage text during the tween
local startTime = tick()
tween.Completed:Connect(function()
	percentageLabel.Text = "100%"
end)

-- Coroutine to update percentage in real-time
coroutine.wrap(function()
	while tween.PlaybackState ~= Enum.PlaybackState.Completed do
		local elapsed = tick() - startTime
		local progress = math.clamp(elapsed / 1800, 0, 1)
		percentageLabel.Text = math.floor(progress * 100) .. "%"
		wait(0.1)  -- Update every 0.1 seconds
	end
end)()

-- Infinite loop to rotate the spinner, simulating loading
while true do
	spinner.Rotation = spinner.Rotation + 8  -- Rotate by 8 degrees each step
	wait(0.0)  -- Wait 0.0 seconds before next rotation (fast rotation)
end
