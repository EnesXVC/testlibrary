-- OrionLibrary.lua
local OrionLibrary = {}

-- UI oluşturma işlevi
function OrionLibrary.CreateUI(parent)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = parent

    local mainFrame = Instance.new("Frame")
    mainFrame.Parent = screenGui
    mainFrame.Size = UDim2.new(0, 300, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

    local title = Instance.new("TextLabel")
    title.Parent = mainFrame
    title.Size = UDim2.new(1, 0, 0.2, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Script Executor"
    title.TextSize = 20
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(0, 0, 0)

    local openButton = Instance.new("TextButton")
    openButton.Parent = mainFrame
    openButton.Size = UDim2.new(0.5, 0, 0.2, 0)
    openButton.Position = UDim2.new(0, 0, 0.2, 0)
    openButton.Text = "Open Scripts"
    openButton.TextSize = 14
    openButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
    openButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    local scriptsFrame = Instance.new("Frame")
    scriptsFrame.Parent = mainFrame
    scriptsFrame.Size = UDim2.new(1, 0, 0.6, 0)
    scriptsFrame.Position = UDim2.new(0, 0, 0.4, 0)
    scriptsFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)

    local scriptsList = {}

    -- Open butonunun işlevselliği
    openButton.MouseButton1Click:Connect(function()
        for _, frame in ipairs(scriptsList) do
            frame.Visible = not frame.Visible
        end
    end)

    -- Script ekleme işlevi
    function OrionLibrary.AddScriptButton(scriptName, description, code)
        local scriptButton = Instance.new("TextButton")
        scriptButton.Parent = scriptsFrame
        scriptButton.Size = UDim2.new(1, 0, 0.2, 0)
        scriptButton.Text = scriptName
        scriptButton.TextSize = 14
        scriptButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        scriptButton.TextColor3 = Color3.fromRGB(0, 0, 0)

        local descriptionLabel = Instance.new("TextLabel")
        descriptionLabel.Parent = scriptButton
        descriptionLabel.Size = UDim2.new(1, 0, 0.2, 0)
        descriptionLabel.Position = UDim2.new(0, 0, 0.8, 0)
        descriptionLabel.Text = description
        descriptionLabel.TextSize = 12
        descriptionLabel.BackgroundTransparency = 1
        descriptionLabel.TextColor3 = Color3.fromRGB(0, 0, 0)

        -- Scripti çalıştırma
        scriptButton.MouseButton1Click:Connect(function()
            local func = loadstring(code)
            if func then
                func()
            else
                warn("Invalid script code.")
            end
        end)

        table.insert(scriptsList, scriptButton)
    end

    return screenGui
end

return OrionLibrary
