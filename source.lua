local CG = game:GetService("CoreGui")
local TS = game:GetService("TweenService")
local PL = game:GetService("Players")
local LP = PL.LocalPlayer

if CG:FindFirstChild("XenonUI") then CG.XenonUI:Destroy() end

_G.XenonLib = {}
local allTabs = {}
local allTabButtons = {}

-- 1. EKRAN ŁADOWANIA (Loader)
local SG = Instance.new("ScreenGui", CG) SG.Name = "XenonUI" SG.ResetOnSpawn = false
local LF = Instance.new("Frame", SG) LF.Size = UDim2.new(0, 360, 0, 180) LF.Position = UDim2.new(0.5, -180, 0.5, -90) LF.BackgroundColor3 = Color3.fromRGB(30, 30, 30) LF.BackgroundTransparency = 1
local LC = Instance.new("UICorner", LF) LC.CornerRadius = UDim.new(0, 12)

-- POWIĘKSZONY NAPIS XENON UI (Zwiększony rozmiar do 36 i dodany GothamBold)
local LT = Instance.new("TextLabel", LF) LT.Size = UDim2.new(1, 0, 0, 50) LT.Position = UDim2.new(0, 0, 0, 35) LT.Text = "Xenon Ui" LT.TextColor3 = Color3.fromRGB(109, 110, 108) LT.Font = Enum.Font.GothamBold LT.TextSize = 36 LT.BackgroundTransparency = 1 LT.TextTransparency = 1
local LS = Instance.new("TextLabel", LF) LS.Size = UDim2.new(1, 0, 0, 20) LS.Position = UDim2.new(0, 0, 0, 85) LS.Text = "Loading components..." LS.TextColor3 = Color3.fromRGB(140, 140, 140) LS.Font = Enum.Font.Gotham LS.TextSize = 12 LS.BackgroundTransparency = 1 LS.TextTransparency = 1
local BB = Instance.new("Frame", LF) BB.Size = UDim2.new(0, 280, 0, 6) BB.Position = UDim2.new(0.5, -140, 0, 125) BB.BackgroundColor3 = Color3.fromRGB(45, 45, 45) BB.BackgroundTransparency = 1 Instance.new("UICorner", BB).CornerRadius = UDim.new(0, 3)
local B = Instance.new("Frame", BB) B.Size = UDim2.new(0, 0, 1, 0) B.BackgroundColor3 = Color3.fromRGB(109, 110, 108) B.BackgroundTransparency = 1 Instance.new("UICorner", B).CornerRadius = UDim.new(0, 3)

-- Płynne pojawianie się
TS:Create(LF, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
TS:Create(LT, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
TS:Create(LS, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
TS:Create(BB, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
TS:Create(B, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()

TS:Create(B, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)}):Play()

-- 2. GŁÓWNE OKNO (Main Frame)
local MF = Instance.new("Frame", SG) MF.Name = "MainFrame" MF.Size = UDim2.new(0, 480, 0, 320) MF.Position = UDim2.new(0.5, -240, 0.5, -160) MF.BackgroundColor3 = Color3.fromRGB(25, 25, 25) MF.Active = true MF.Draggable = true MF.ClipsDescendants = true MF.Visible = false
Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 10)

local SB = Instance.new("Frame", MF) SB.Name = "SideBar" SB.Size = UDim2.new(0, 120, 1, -55) SB.Position = UDim2.new(0, 10, 0, 45) SB.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
Instance.new("UICorner", SB).CornerRadius = UDim.new(0, 8)
local SL = Instance.new("UIListLayout", SB) SL.Padding = UDim.new(0, 5) SL.SortOrder = Enum.SortOrder.LayoutOrder
local SP = Instance.new("UIPadding", SB) SP.PaddingTop = UDim.new(0, 6) SP.PaddingLeft = UDim.new(0, 6) SP.PaddingRight = UDim.new(0, 6)
local Pgs = Instance.new("Frame", MF) Pgs.Size = UDim2.new(1, -150, 1, -55) Pgs.Position = UDim2.new(0, 140, 0, 45) Pgs.BackgroundTransparency = 1
local IP = Instance.new("Frame", Pgs) IP.Size = UDim2.new(1, 0, 1, 0) IP.BackgroundTransparency = 1 IP.Visible = true
local TB = Instance.new("Frame", MF) TB.Size = UDim2.new(1, 0, 0, 40) TB.BackgroundTransparency = 1
local MT = Instance.new("TextLabel", TB) MT.Size = UDim2.new(0.5, 0, 1, 0) MT.Position = UDim2.new(0, 15, 0, 0) MT.Text = "Xenon Ui" MT.TextColor3 = Color3.fromRGB(109, 110, 108) MT.Font = Enum.Font.GothamBold MT.TextSize = 16 MT.TextXAlignment = Enum.TextXAlignment.Left MT.BackgroundTransparency = 1
local Hd = Instance.new("Frame", TB) Hd.Size = UDim2.new(0, 80, 1, 0) Hd.Position = UDim2.new(1, -95, 0, 0) Hd.BackgroundTransparency = 1
local HL = Instance.new("UIListLayout", Hd) HL.FillDirection = Enum.FillDirection.Horizontal HL.HorizontalAlignment = Enum.HorizontalAlignment.Right HL.VerticalAlignment = Enum.VerticalAlignment.Center HL.Padding = UDim.new(0, 8)

local function tBtn(txt, clr)
    local b = Instance.new("TextButton", Hd) b.Size = UDim2.new(0, 28, 0, 28) b.Text = txt b.TextColor3 = clr b.BackgroundColor3 = Color3.fromRGB(38, 38, 38) b.Font = Enum.Font.GothamBold b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6) return b
end

local CBtn = tBtn("X", Color3.fromRGB(255, 90, 90))
local MBtn = tBtn("-", Color3.fromRGB(255, 255, 255))

CBtn.MouseButton1Click:Connect(function()
    local closeTween = TS:Create(MF, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
    closeTween:Play()
    closeTween.Completed:Connect(function() SG:Destroy() end)
end)

local min = false
MBtn.MouseButton1Click:Connect(function()
    min = not min
    local targetSize = min and UDim2.new(0, 480, 0, 40) or UDim2.new(0, 480, 0, 320)
    TS:Create(MF, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = targetSize}):Play()
end)

task.delay(1.7, function()
    TS:Create(LF, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TS:Create(LT, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TS:Create(LS, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TS:Create(BB, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TS:Create(B, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    task.wait(0.3) LF:Destroy() MF.Visible = true MF.Size = UDim2.new(0, 0, 0, 0) MF.Position = UDim2.new(0.5, 0, 0.5, 0)
    TS:Create(MF, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 480, 0, 320), Position = UDim2.new(0.5, -240, 0.5, -160)}):Play()
end)

-- 3. INTERFEJS DLA PROGRAMISTY
function _G.XenonLib:Load(name) MT.Text = name or "Xenon Ui" end

function _G.XenonLib:CreateTab(name)
    local TBtn = Instance.new("TextButton", SB) TBtn.Size = UDim2.new(1, 0, 0, 30) TBtn.BackgroundColor3 = Color3.fromRGB(42, 42, 42) TBtn.Text = name TBtn.TextColor3 = Color3.fromRGB(200, 200, 200) TBtn.Font = Enum.Font.GothamMedium TBtn.TextSize = 12
    Instance.new("UICorner", TBtn).CornerRadius = UDim.new(0, 5)
    table.insert(allTabButtons, TBtn)

    local CPg = Instance.new("ScrollingFrame", Pgs) CPg.Size = UDim2.new(1, 0, 1, 0) CPg.BackgroundTransparency = 1 CPg.Visible = false CPg.ScrollBarThickness = 2
    Instance.new("UIListLayout", CPg).Padding = UDim.new(0, 6)
    table.insert(allTabs, CPg)

    TBtn.MouseButton1Click:Connect(function()
        IP.Visible = false
        for i, v in pairs(allTabs) do
            v.Visible = false
            TS:Create(allTabButtons[i], TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(42, 42, 42), TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        end
        CPg.Visible = true
        TS:Create(TBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(109, 110, 108), TextColor3 = Color3.fromRGB(25, 25, 25)}):Play()
    end)

    local Actions = {}
    function Actions:CreateButton(txt, cb)
        local Btn = Instance.new("TextButton", CPg) Btn.Size = UDim2.new(1, -8, 0, 36) Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40) Btn.Text = "  " .. txt Btn.TextColor3 = Color3.fromRGB(220, 220, 220) Btn.Font = Enum.Font.GothamMedium Btn.TextSize = 13 Btn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
        local St = Instance.new("UIStroke", Btn) St.Color = Color3.fromRGB(50, 50, 50) St.Thickness = 1

        Btn.MouseButton1Click:Connect(function()
            local press = TS:Create(Btn, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(109, 110, 108), TextColor3 = Color3.fromRGB(25, 25, 25)})
            local release = TS:Create(Btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(40, 40, 40), TextColor3 = Color3.fromRGB(220, 220, 220)})
            press:Play()
            press.Completed:Connect(function() release:Play() end)
            pcall(cb)
        end)
    end
        function Actions:CreateSlider(sliderText, minVal, maxVal, defaultVal, callback)
        local SliderFrame = Instance.new("Frame", CPg)
        SliderFrame.Size = UDim2.new(1, -8, 0, 50)
        SliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0, 6)
        local St = Instance.new("UIStroke", SliderFrame) St.Color = Color3.fromRGB(50, 50, 50) St.Thickness = 1

        local Title = Instance.new("TextLabel", SliderFrame)
        Title.Size = UDim2.new(0.6, 0, 0, 20)
        Title.Position = UDim2.new(0, 10, 0, 5)
        Title.Text = sliderText
        Title.TextColor3 = Color3.fromRGB(220, 220, 220)
        Title.Font = Enum.Font.GothamMedium
        Title.TextSize = 13
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.BackgroundTransparency = 1

        local ValueLabel = Instance.new("TextLabel", SliderFrame)
        ValueLabel.Size = UDim2.new(0.3, 0, 0, 20)
        ValueLabel.Position = UDim2.new(0.7, -10, 0, 5)
        ValueLabel.Text = tostring(defaultVal)
        ValueLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
        ValueLabel.Font = Enum.Font.GothamMedium
        ValueLabel.TextSize = 13
        ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
        ValueLabel.BackgroundTransparency = 1

        local SliderBg = Instance.new("Frame", SliderFrame)
        SliderBg.Size = UDim2.new(1, -20, 0, 6)
        SliderBg.Position = UDim2.new(0, 10, 0, 32)
        SliderBg.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
        Instance.new("UICorner", SliderBg).CornerRadius = UDim.new(0, 3)

        local SliderBar = Instance.new("Frame", SliderBg)
        SliderBar.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
        SliderBar.BackgroundColor3 = Color3.fromRGB(109, 110, 108)
        Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(0, 3)

        local UserInputService = game:GetService("UserInputService")
        local isDragging = false

        local function updateSlider(input)
            local percentage = math.clamp((input.Position.X - SliderBg.AbsolutePosition.X) / SliderBg.AbsoluteSize.X, 0, 1)
            local value = math.floor(minVal + (percentage * (maxVal - minVal)))
            SliderBar.Size = UDim2.new(percentage, 0, 1, 0)
            ValueLabel.Text = tostring(value)
            pcall(callback, value)
        end

        SliderFrame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                isDragging = true
                updateSlider(input)
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                updateSlider(input)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                isDragging = false
            end
        end)
    end

       task.spawn(function()
        if name == "Info!" and CPg then
            task.wait(0.1)
            for _, oldChild in pairs(CPg:GetChildren()) do
    if not oldChild:IsA("UIListLayout") then oldChild:Destroy() end
end

            local Av = Instance.new("ImageLabel", CPg) Av.Size = UDim2.new(0,70,0,70) Av.Position = UDim2.new(0,15,0,20) Av.BackgroundColor3 = Color3.fromRGB(40,40,40) Av.BorderSizePixel = 0
            local Ac = Instance.new("UICorner", Av) Ac.CornerRadius = UDim.new(0,35)
            pcall(function() Av.Image = game:GetService("Players"):GetUserThumbnailAsync(game:GetService("Players").LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) end)
            local Wl = Instance.new("TextLabel", CPg) Wl.Size = UDim2.new(1,-110,0,20) Wl.Position = UDim2.new(0,100,0,30) Wl.Text = "Welcome back," Wl.TextColor3 = Color3.fromRGB(140,140,140) Wl.Font = Enum.Font.Gotham Wl.TextSize = 14 Wl.TextXAlignment = Enum.TextXAlignment.Left Wl.BackgroundTransparency = 1
            local Nk = Instance.new("TextLabel", CPg) Nk.Size = UDim2.new(1,-110,0,25) Nk.Position = UDim2.new(0,100,0,50) Nk.Text = game:GetService("Players").LocalPlayer.Name Nk.TextColor3 = Color3.fromRGB(255,255,255) Nk.Font = Enum.Font.GothamBold Nk.TextSize = 18 Nk.TextXAlignment = Enum.TextXAlignment.Left Nk.BackgroundTransparency = 1
            CPg.Visible = true
        end
    end)
 
    return Actions
end

_G.XenonLib:Load("Xenon Ui")

-- Automatyczne tworzenie i otwieranie zakładki na start
local AutoInfoTab = _G.XenonLib:CreateTab("Info!")

return _G.XenonLib
