-- UI Library Example

local UI_Library = {}

-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")

-- Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.300000012, 417, 0.0500000007, 234)
Frame.Size = UDim2.new(0, 200, 0, 50)

Title.Parent = Frame
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Font = Enum.Font.SourceSans
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextSize = 18.000

UICorner.Parent = Frame

-- Function to add buttons:
function UI_Library.AddButton(buttonName, buttonText, scriptCode)
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Parent = Frame
    buttonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    buttonFrame.Size = UDim2.new(0, 180, 0, 30)
    
    local button = Instance.new("TextButton")
    button.Parent = buttonFrame
    button.Size = UDim2.new(1, 0, 1, 0)
    button.Text = buttonText
    button.Font = Enum.Font.SourceSans
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.TextSize = 14

    button.MouseButton1Click:Connect(function()
        loadstring(scriptCode)()
    end)
end

-- Example of adding a button with a script
UI_Library.AddButton("TestButton", "Click Me!", [[
    print("Button clicked!")
]])

-- To change title dynamically:
game.CoreGui.ScreenGui.Frame.Title.Text = "Custom Title Here"
