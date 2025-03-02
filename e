local GUI = {}

-- GUI'yi oluştur
function GUI:Setup()
    -- GUI Elemanları
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Open = Instance.new("TextButton")
    local Title = Instance.new("TextLabel")
    local Scripts = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Frame_2 = Instance.new("Frame")
    local TextButton = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    local UICorner_3 = Instance.new("UICorner")

    -- ScreenGui ayarları
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Frame ayarları
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.300000012, 417, 0.0500000007, 234)
    Frame.Size = UDim2.new(0, 165, 0, 34)

    -- Open button ayarları
    Open.Name = "Open"
    Open.Parent = Frame
    Open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Open.BorderSizePixel = 0
    Open.Position = UDim2.new(0.806060612, 0, 0.176470593, 0)
    Open.Size = UDim2.new(0.150000006, 0, 0.800000012, 0)
    Open.Font = Enum.Font.SourceSans
    Open.TextColor3 = Color3.fromRGB(0, 0, 0)
    Open.TextSize = 14.000

    -- Title ayarları
    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.Font = Enum.Font.SourceSans
    Title.TextColor3 = Color3.fromRGB(0, 0, 0)
    Title.TextSize = 14.000

    -- Scripts Frame ayarları
    Scripts.Name = "Scripts"
    Scripts.Parent = Frame
    Scripts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Scripts.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Scripts.BorderSizePixel = 0
    Scripts.Position = UDim2.new(0, 0, 0.899999976, 0)
    Scripts.Size = UDim2.new(1, 0, 0.100000001, 0)

    -- UICorner ekle
    UICorner.Parent = Scripts

    -- Frame_2 ayarları
    Frame_2.Parent = Scripts
    Frame_2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    Frame_2.BorderColor3 = Color3.fromRGB(16, 16, 16)
    Frame_2.BorderSizePixel = 0
    Frame_2.Position = UDim2.new(0, 0, 0.882352889, 0)
    Frame_2.Size = UDim2.new(1, 0, 11, 0)
    Frame_2.Visible = false

    -- TextButton ayarları
    TextButton.Parent = Frame_2
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0.100000001, 0, 0.150000006, 0)
    TextButton.Size = UDim2.new(0.800000012, 0, 0.699999988, 0)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 14.000

    -- UICorner ekle
    UICorner_2.Parent = TextButton
    UICorner_3.Parent = Frame
end

-- AddButton fonksiyonu
function GUI:AddButton(buttonName, buttonText, buttonScript)
    -- Button ekle
    local button = Instance.new("TextButton")
    button.Name = buttonName
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0, 60)
    button.Text = buttonText
    button.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("CustomGUI").Scripts

    -- Scripti ekle
    local newScript = Instance.new("LocalScript")
    newScript.Source = buttonScript
    newScript.Parent = button

    -- Buttona tıklama olayını ekle
    button.MouseButton1Click:Connect(function()
        loadstring(buttonScript)()
    end)
end

-- GUI'yi başlat
GUI:Setup()

-- Örnek Button ekleme
GUI:AddButton("TestButton", "Click Me", [[
    print("Button clicked!")
]])

return GUI
