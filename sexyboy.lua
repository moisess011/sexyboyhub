-- // SexyBoy Hub v5.4 - CFrame Mobile Fly (100% Fix)
-- // Interfaz Rediseñada & Controles Interactivos optimizados para Móviles

local player = game.Players.LocalPlayer
local Event = game:GetService("ReplicatedStorage"):WaitForChild("Event")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

-- Destruir interfaz previa si existe
local oldGui = player:WaitForChild("PlayerGui"):FindFirstChild("SexyBoyHub")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SexyBoyHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

local lang = "ES"

local T = {
    ES = {
        title = "SEXYBOY",
        subtitle = "HUB VIP v5.4",
        combat = "Combate",
        movement = "Movimiento",
        teleports = "Teleports",
        settings = "Ajustes",
        killAura = "KillAura Rifle",
        killAuraDesc = "Elimina automáticamente a enemigos cercanos",
        rpg = "Auto RPG",
        rpgDesc = "Dispara RPG predictivo a objetivos",
        turret = "Torreta Predictiva",
        turretDesc = "Apunta y derriba vehículos aéreos",
        refresh = "Refresh Server",
        refreshDesc = "Recarga ForceField moviéndote al Harbour",
        refreshCS = "Refresh Client",
        refreshCSDesc = "Obtén ForceField estático de cliente",
        speed = "Velocidad Personalizada",
        speedDesc = "Ajusta tu velocidad de caminata",
        jump = "Salto Infinito",
        jumpDesc = "Permite saltar de forma continua en el aire",
        fly = "Vuelo CFrame Mobile",
        flyDesc = "Vuelo 100% fluido guiado por la mira y el joystick",
        flySpeed = "Velocidad de Vuelo",
        flySpeedDesc = "Ajusta la velocidad mientras estás volando",
        harbour = "Harbour Base",
        islandA = "Island A",
        islandB = "Island B",
        islandC = "Island C",
        carrier = "Carrier Ship",
        battleship = "Battleship",
        tpDesc = "Teletransporte instantáneo",
        language = "Idioma / Language",
        langDesc = "Selecciona la interfaz preferida",
    },
    EN = {
        title = "SEXYBOY",
        subtitle = "HUB VIP v5.4",
        combat = "Combat",
        movement = "Movement",
        teleports = "Teleports",
        settings = "Settings",
        killAura = "KillAura Rifle",
        killAuraDesc = "Automatically targets nearby enemies",
        rpg = "Auto RPG",
        rpgDesc = "Fires predictive RPG at targets",
        turret = "Predictive Turret",
        turretDesc = "Locks and shoots down aircraft",
        refresh = "Refresh Server",
        refreshDesc = "Gives ForceField via Harbour TP",
        refreshCS = "Refresh Client",
        refreshCSDesc = "Static client-side ForceField",
        speed = "Custom Speed",
        speedDesc = "Adjust your walk speed",
        jump = "Infinite Jump",
        jumpDesc = "Allows continuous mid-air jumps",
        fly = "CFrame Mobile Fly",
        flyDesc = "100% smooth flight guided by camera and joystick",
        flySpeed = "Fly Speed",
        flySpeedDesc = "Adjust speed while flying",
        harbour = "Harbour Base",
        islandA = "Island A",
        islandB = "Island B",
        islandC = "Island C",
        carrier = "Carrier Ship",
        battleship = "Battleship",
        tpDesc = "Instant teleportation",
        language = "Language",
        langDesc = "Select preferred interface language",
    }
}

local function t(key)
    return T[lang][key] or key
end

-- Blur Effect para la carga/login
local blur = Instance.new("BlurEffect")
blur.Size = 18
blur.Parent = Lighting

-- Floating Reopen Button
local floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 48, 0, 48)
floatBtn.Position = UDim2.new(1, -65, 0.5, -24)
floatBtn.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
floatBtn.Text = "⚡"
floatBtn.TextColor3 = Color3.fromRGB(0, 230, 160)
floatBtn.TextSize = 20
floatBtn.Visible = false
floatBtn.Parent = screenGui

local floatCorner = Instance.new("UICorner", floatBtn)
floatCorner.CornerRadius = UDim.new(0, 12)
local floatStroke = Instance.new("UIStroke", floatBtn)
floatStroke.Color = Color3.fromRGB(0, 230, 160)
floatStroke.Thickness = 1.5
floatStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

floatBtn.Active = true
floatBtn.Draggable = true

-- ==================== LOADING SCREEN ====================
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 340, 0, 190)
loadingFrame.Position = UDim2.new(0.5, -170, 0.5, -95)
loadingFrame.BackgroundColor3 = Color3.fromRGB(13, 15, 20)
loadingFrame.Parent = screenGui

Instance.new("UICorner", loadingFrame).CornerRadius = UDim.new(0, 14)
local loadStroke = Instance.new("UIStroke", loadingFrame)
loadStroke.Color = Color3.fromRGB(30, 35, 48)
loadStroke.Thickness = 1

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1, 0, 0, 40)
loadTitle.Position = UDim2.new(0, 0, 0, 25)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "SEXYBOY HUB"
loadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
loadTitle.TextSize = 22
loadTitle.Font = Enum.Font.GothamBold
loadTitle.Parent = loadingFrame

local loadSub = Instance.new("TextLabel")
loadSub.Size = UDim2.new(1, 0, 0, 20)
loadSub.Position = UDim2.new(0, 0, 0, 60)
loadSub.BackgroundTransparency = 1
loadSub.Text = "Iniciando sistema VIP..."
loadSub.TextColor3 = Color3.fromRGB(0, 230, 160)
loadSub.TextSize = 12
loadSub.Font = Enum.Font.GothamMedium
loadSub.Parent = loadingFrame

local loadBarBg = Instance.new("Frame")
loadBarBg.Size = UDim2.new(0.82, 0, 0, 6)
loadBarBg.Position = UDim2.new(0.09, 0, 0, 115)
loadBarBg.BackgroundColor3 = Color3.fromRGB(25, 28, 38)
loadBarBg.Parent = loadingFrame
Instance.new("UICorner", loadBarBg).CornerRadius = UDim.new(1, 0)

local loadFill = Instance.new("Frame")
loadFill.Size = UDim2.new(0, 0, 1, 0)
loadFill.BackgroundColor3 = Color3.fromRGB(0, 230, 160)
loadFill.Parent = loadBarBg
Instance.new("UICorner", loadFill).CornerRadius = UDim.new(1, 0)

local percentLbl = Instance.new("TextLabel")
percentLbl.Size = UDim2.new(1, 0, 0, 20)
percentLbl.Position = UDim2.new(0, 0, 0, 135)
percentLbl.BackgroundTransparency = 1
percentLbl.Text = "0%"
percentLbl.TextColor3 = Color3.fromRGB(120, 125, 140)
percentLbl.TextSize = 11
percentLbl.Font = Enum.Font.Gotham
percentLbl.Parent = loadingFrame

task.spawn(function()
    local stages = {"Cargando dependencias...", "Verificando bypass...", "Conectando al servidor...", "Listo!"}
    for i = 1, 100 do
        loadFill.Size = UDim2.new(i/100, 0, 1, 0)
        percentLbl.Text = tostring(i) .. "%"
        if i == 25 then loadSub.Text = stages[1]
        elseif i == 55 then loadSub.Text = stages[2]
        elseif i == 85 then loadSub.Text = stages[3]
        elseif i == 98 then loadSub.Text = stages[4] end
        task.wait(0.015)
    end
    task.wait(0.2)
    loadingFrame:Destroy()
    showLogin()
end)

-- ==================== LOGIN SCREEN ====================
function showLogin()
    local loginFrame = Instance.new("Frame")
    loginFrame.Size = UDim2.new(0, 320, 0, 280)
    loginFrame.Position = UDim2.new(0.5, -160, 0.5, -140)
    loginFrame.BackgroundColor3 = Color3.fromRGB(13, 15, 20)
    loginFrame.Parent = screenGui

    Instance.new("UICorner", loginFrame).CornerRadius = UDim.new(0, 14)
    local lStroke = Instance.new("UIStroke", loginFrame)
    lStroke.Color = Color3.fromRGB(30, 35, 48)
    lStroke.Thickness = 1

    local lTitle = Instance.new("TextLabel")
    lTitle.Size = UDim2.new(1, 0, 0, 30)
    lTitle.Position = UDim2.new(0, 0, 0, 22)
    lTitle.BackgroundTransparency = 1
    lTitle.Text = "Autenticación VIP"
    lTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    lTitle.TextSize = 18
    lTitle.Font = Enum.Font.GothamBold
    lTitle.Parent = loginFrame

    local lSub = Instance.new("TextLabel")
    lSub.Size = UDim2.new(1, 0, 0, 18)
    lSub.Position = UDim2.new(0, 0, 0, 50)
    lSub.BackgroundTransparency = 1
    lSub.Text = "Ingresa tus credenciales de acceso"
    lSub.TextColor3 = Color3.fromRGB(120, 125, 140)
    lSub.TextSize = 11
    lSub.Font = Enum.Font.Gotham
    lSub.Parent = loginFrame

    local function createInput(placeholder, y, isPass)
        local box = Instance.new("TextBox")
        box.Size = UDim2.new(0.84, 0, 0, 42)
        box.Position = UDim2.new(0.08, 0, 0, y)
        box.BackgroundColor3 = Color3.fromRGB(20, 23, 31)
        box.PlaceholderText = placeholder
        box.PlaceholderColor3 = Color3.fromRGB(90, 95, 110)
        box.Text = ""
        box.TextColor3 = Color3.fromRGB(240, 240, 245)
        box.TextSize = 13
        box.Font = Enum.Font.GothamSemibold
        box.ClearTextOnFocus = false
        box.Parent = loginFrame
        
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 9)
        local bStroke = Instance.new("UIStroke", box)
        bStroke.Color = Color3.fromRGB(35, 40, 52)
        bStroke.Thickness = 1

        box.Focused:Connect(function()
            TweenService:Create(bStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 230, 160)}):Play()
        end)
        box.FocusLost:Connect(function()
            TweenService:Create(bStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(35, 40, 52)}):Play()
        end)

        return box
    end

    local userBox = createInput("Usuario", 82, false)
    local passBox = createInput("Contraseña", 136, true)

    local enterBtn = Instance.new("TextButton")
    enterBtn.Size = UDim2.new(0.84, 0, 0, 42)
    enterBtn.Position = UDim2.new(0.08, 0, 0, 202)
    enterBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 140)
    enterBtn.Text = "Iniciar Sesión"
    enterBtn.TextColor3 = Color3.fromRGB(10, 12, 16)
    enterBtn.TextSize = 13
    enterBtn.Font = Enum.Font.GothamBold
    enterBtn.Parent = loginFrame
    Instance.new("UICorner", enterBtn).CornerRadius = UDim.new(0, 9)

    enterBtn.MouseButton1Click:Connect(function()
        if userBox.Text == "sexyboy01" and passBox.Text == "messi10" then
            if blur then blur:Destroy() end
            loginFrame:Destroy()
            createHub()
        else
            userBox.Text = ""
            passBox.Text = ""
            lSub.Text = "Credenciales incorrectas"
            lSub.TextColor3 = Color3.fromRGB(245, 80, 80)
        end
    end)
end

-- ==================== UI BUILDERS ====================
local mainFrame = nil

local function createToggle(parent, name, desc, y, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -20, 0, 54)
    row.Position = UDim2.new(0, 10, 0, y)
    row.BackgroundColor3 = Color3.fromRGB(20, 23, 31)
    row.Parent = parent
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 0, 22)
    label.Position = UDim2.new(0, 12, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(235, 240, 245)
    label.TextSize = 13
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = row

    local descL = Instance.new("TextLabel")
    descL.Size = UDim2.new(0.7, 0, 0, 16)
    descL.Position = UDim2.new(0, 12, 0, 28)
    descL.BackgroundTransparency = 1
    descL.Text = desc
    descL.TextColor3 = Color3.fromRGB(110, 115, 130)
    descL.TextSize = 10
    descL.Font = Enum.Font.Gotham
    descL.TextXAlignment = Enum.TextXAlignment.Left
    descL.Parent = row

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 42, 0, 22)
    toggle.Position = UDim2.new(1, -52, 0.5, -11)
    toggle.BackgroundColor3 = Color3.fromRGB(35, 40, 52)
    toggle.Text = ""
    toggle.Parent = row
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 16, 0, 16)
    circle.Position = UDim2.new(0, 3, 0.5, -8)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circle.Parent = toggle
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(toggle, TweenInfo.new(0.18), {
            BackgroundColor3 = state and Color3.fromRGB(0, 230, 160) or Color3.fromRGB(35, 40, 52)
        }):Play()
        TweenService:Create(circle, TweenInfo.new(0.18), {
            Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        }):Play()
        callback(state)
    end)
    return row
end

local function createSlider(parent, name, desc, y, minVal, maxVal, defaultVal, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -20, 0, 62)
    row.Position = UDim2.new(0, 10, 0, y)
    row.BackgroundColor3 = Color3.fromRGB(20, 23, 31)
    row.Parent = parent
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, 0, 0, 20)
    label.Position = UDim2.new(0, 12, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(235, 240, 245)
    label.TextSize = 13
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = row

    local valLbl = Instance.new("TextLabel")
    valLbl.Size = UDim2.new(0.3, 0, 0, 20)
    valLbl.Position = UDim2.new(0.7, -12, 0, 6)
    valLbl.BackgroundTransparency = 1
    valLbl.Text = tostring(defaultVal)
    valLbl.TextColor3 = Color3.fromRGB(0, 230, 160)
    valLbl.TextSize = 12
    valLbl.Font = Enum.Font.GothamBold
    valLbl.TextXAlignment = Enum.TextXAlignment.Right
    valLbl.Parent = row

    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(1, -24, 0, 6)
    sliderBg.Position = UDim2.new(0, 12, 0, 42)
    sliderBg.BackgroundColor3 = Color3.fromRGB(35, 40, 52)
    sliderBg.Parent = row
    Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(1, 0)

    local sliderFill = Instance.new("Frame")
    local initRatio = (defaultVal - minVal) / (maxVal - minVal)
    sliderFill.Size = UDim2.new(initRatio, 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(0, 230, 160)
    sliderFill.Parent = sliderBg
    Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1, 0)

    local dragging = false
    local function update(input)
        local pos = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
        sliderFill.Size = UDim2.new(pos, 0, 1, 0)
        local currentVal = math.floor(minVal + (maxVal - minVal) * pos)
        valLbl.Text = tostring(currentVal)
        callback(currentVal)
    end

    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)

    return row
end

local function createButton(parent, name, desc, y, accentColor, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 50)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(20, 23, 31)
    btn.Text = ""
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 3, 0, 26)
    indicator.Position = UDim2.new(0, 0, 0.5, -13)
    indicator.BackgroundColor3 = accentColor or Color3.fromRGB(0, 230, 160)
    indicator.Parent = btn
    Instance.new("UICorner", indicator).CornerRadius = UDim.new(1, 0)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 22)
    label.Position = UDim2.new(0, 14, 0, 6)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(235, 240, 245)
    label.TextSize = 13
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = btn

    local descL = Instance.new("TextLabel")
    descL.Size = UDim2.new(1, -20, 0, 16)
    descL.Position = UDim2.new(0, 14, 0, 26)
    descL.BackgroundTransparency = 1
    descL.Text = desc
    descL.TextColor3 = Color3.fromRGB(110, 115, 130)
    descL.TextSize = 10
    descL.Font = Enum.Font.Gotham
    descL.TextXAlignment = Enum.TextXAlignment.Left
    descL.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ==================== MAIN HUB ====================
function createHub()
    if mainFrame then mainFrame:Destroy() end

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 480, 0, 360)
    main.Position = UDim2.new(0.5, -240, 0.5, -180)
    main.BackgroundColor3 = Color3.fromRGB(13, 15, 20)
    main.Active = true
    main.Draggable = true
    main.Parent = screenGui
    
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
    local mStroke = Instance.new("UIStroke", main)
    mStroke.Color = Color3.fromRGB(30, 35, 48)
    mStroke.Thickness = 1
    mainFrame = main

    floatBtn.Visible = false

    -- Sidebar Left
    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 130, 1, 0)
    sidebar.BackgroundColor3 = Color3.fromRGB(17, 19, 26)
    sidebar.Parent = main
    Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

    local brand = Instance.new("TextLabel")
    brand.Size = UDim2.new(1, -16, 0, 22)
    brand.Position = UDim2.new(0, 12, 0, 16)
    brand.BackgroundTransparency = 1
    brand.Text = t("title")
    brand.TextColor3 = Color3.fromRGB(255, 255, 255)
    brand.TextSize = 15
    brand.Font = Enum.Font.GothamBold
    brand.TextXAlignment = Enum.TextXAlignment.Left
    brand.Parent = sidebar

    local brandSub = Instance.new("TextLabel")
    brandSub.Size = UDim2.new(1, -16, 0, 14)
    brandSub.Position = UDim2.new(0, 12, 0, 36)
    brandSub.BackgroundTransparency = 1
    brandSub.Text = t("subtitle")
    brandSub.TextColor3 = Color3.fromRGB(0, 230, 160)
    brandSub.TextSize = 9
    brandSub.Font = Enum.Font.GothamBold
    brandSub.TextXAlignment = Enum.TextXAlignment.Left
    brandSub.Parent = sidebar

    -- Header Top Right
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 26, 0, 26)
    closeBtn.Position = UDim2.new(1, -34, 0, 12)
    closeBtn.BackgroundColor3 = Color3.fromRGB(22, 25, 34)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(140, 145, 160)
    closeBtn.TextSize = 12
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = main
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

    closeBtn.MouseButton1Click:Connect(function()
        main.Visible = false
        floatBtn.Visible = true
    end)

    floatBtn.MouseButton1Click:Connect(function()
        main.Visible = true
        floatBtn.Visible = false
    end)

    -- Navigation Tabs
    local pages, tabBtns = {}, {}
    local tabNames = {"combat", "movement", "teleports", "settings"}
    local tabLabels = {t("combat"), t("movement"), t("teleports"), t("settings")}

    local tabHolder = Instance.new("Frame")
    tabHolder.Size = UDim2.new(1, -16, 1, -70)
    tabHolder.Position = UDim2.new(0, 8, 0, 60)
    tabHolder.BackgroundTransparency = 1
    tabHolder.Parent = sidebar

    for i, key in ipairs(tabNames) do
        local tab = Instance.new("TextButton")
        tab.Size = UDim2.new(1, 0, 0, 34)
        tab.Position = UDim2.new(0, 0, 0, (i-1) * 38)
        tab.BackgroundColor3 = (i == 1) and Color3.fromRGB(24, 28, 38) or Color3.fromRGB(0, 0, 0)
        tab.BackgroundTransparency = (i == 1) and 0 or 1
        tab.Text = "  " .. tabLabels[i]
        tab.TextColor3 = (i == 1) and Color3.fromRGB(0, 230, 160) or Color3.fromRGB(120, 125, 140)
        tab.TextSize = 11
        tab.Font = Enum.Font.GothamSemibold
        tab.TextXAlignment = Enum.TextXAlignment.Left
        tab.Parent = tabHolder
        Instance.new("UICorner", tab).CornerRadius = UDim.new(0, 6)

        local page = Instance.new("ScrollingFrame")
        page.Size = UDim2.new(1, -145, 1, -50)
        page.Position = UDim2.new(0, 138, 0, 44)
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 2
        page.ScrollBarImageColor3 = Color3.fromRGB(40, 45, 60)
        page.CanvasSize = UDim2.new(0, 0, 0, 360)
        page.Visible = (i == 1)
        page.Parent = main

        pages[key] = page
        tabBtns[key] = tab

        tab.MouseButton1Click:Connect(function()
            for k, p in pairs(pages) do
                local isTarget = (k == key)
                p.Visible = isTarget
                tabBtns[k].BackgroundTransparency = isTarget and 0 or 1
                tabBtns[k].BackgroundColor3 = isTarget and Color3.fromRGB(24, 28, 38) or Color3.fromRGB(0, 0, 0)
                tabBtns[k].TextColor3 = isTarget and Color3.fromRGB(0, 230, 160) or Color3.fromRGB(120, 125, 140)
            end
        end)
    end

    -- ===== COMBAT =====
    local killAura = false
    createToggle(pages["combat"], t("killAura"), t("killAuraDesc"), 5, function(on)
        killAura = on
        if on then
            task.spawn(function()
                while killAura do
                    pcall(function()
                        Event:FireServer("shootRifle", "", {})
                        for _, plr in pairs(game.Players:GetPlayers()) do
                            if plr ~= player and plr.Team ~= player.Team and plr.Character then
                                local tg = plr.Character:FindFirstChild("Head") or plr.Character:FindFirstChild("HumanoidRootPart")
                                local h = plr.Character:FindFirstChild("Humanoid")
                                if tg and h and h.Health > 0 then
                                    Event:FireServer("shootRifle", "", {tg})
                                    Event:FireServer("shootRifle", "hit", {h})
                                end
                            end
                        end
                    end)
                    task.wait(0.07)
                end
            end)
        end
    end)

    local rpg = false
    createToggle(pages["combat"], t("rpg"), t("rpgDesc"), 65, function(on)
        rpg = on
        if on then
            task.spawn(function()
                while rpg do
                    pcall(function()
                        for _, plr in pairs(game.Players:GetPlayers()) do
                            if plr ~= player and plr.Team ~= player.Team and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                                local r = plr.Character.HumanoidRootPart
                                if r.Position.Y > 50 then
                                    local v = r.AssemblyLinearVelocity or r.Velocity
                                    Event:FireServer("fireRPG", {r.Position + v * 0.4})
                                end
                            end
                        end
                    end)
                    task.wait(0.35)
                end
            end)
        end
    end)

    local turret = false
    createToggle(pages["combat"], t("turret"), t("turretDesc"), 125, function(on)
        turret = on
        if on then
            task.spawn(function()
                while turret do
                    pcall(function()
                        local best, score = nil, math.huge
                        local cam = workspace.CurrentCamera
                        local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
                        for _, plr in pairs(game.Players:GetPlayers()) do
                            if plr ~= player and plr.Team ~= player.Team and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                                local r = plr.Character.HumanoidRootPart
                                if r.Position.Y < 50 then continue end
                                local sp, onS = cam:WorldToViewportPoint(r.Position)
                                if onS then
                                    local d = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                                    if d < score then score = d best = r end
                                end
                            end
                        end
                        if best then
                            local v = best.AssemblyLinearVelocity or best.Velocity
                            local dist = (best.Position - (player.Character and player.Character.HumanoidRootPart.Position or Vector3.new())).Magnitude
                            local tm = dist / 320
                            if dist > 600 then tm = tm * 1.15 end
                            Event:FireServer("aim", {best.Position + v * tm})
                            Event:FireServer("shoot", {true})
                            task.wait(0.09)
                            Event:FireServer("shoot", {false})
                        end
                    end)
                    task.wait(0.1)
                end
            end)
        end
    end)

    createButton(pages["combat"], t("refresh"), t("refreshDesc"), 185, Color3.fromRGB(0, 180, 220), function()
        task.spawn(function()
            local char = player.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChild("Humanoid")
            if not hrp or not hum then return end
            local last = hrp.CFrame
            local seat = Instance.new("Seat")
            seat.Transparency = 1
            seat.CanCollide = false
            seat.Anchored = true
            seat.Size = Vector3.new(2, 0.4, 2)
            seat.CFrame = hrp.CFrame * CFrame.new(0, -1.5, 0)
            seat.Parent = workspace
            seat:Sit(hum)
            task.wait(0.15)
            Event:FireServer("Teleport", {"Harbour", ""})
            task.wait(0.85)
            if char:FindFirstChild("HumanoidRootPart") then char.HumanoidRootPart.CFrame = last end
            task.wait(0.2)
            seat:Destroy()
        end)
    end)

    createButton(pages["combat"], t("refreshCS"), t("refreshCSDesc"), 242, Color3.fromRGB(0, 230, 160), function()
        task.spawn(function()
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            local hum = char:WaitForChild("Humanoid")
            local seat = Instance.new("Seat")
            seat.Transparency = 1
            seat.CanCollide = false
            seat.Anchored = false
            seat.Size = Vector3.new(2, 0.5, 2)
            seat.CFrame = hrp.CFrame * CFrame.new(0, -2, 0)
            seat.Parent = workspace
            local w = Instance.new("WeldConstraint")
            w.Part0 = hrp
            w.Part1 = seat
            w.Parent = seat
            task.wait(0.1)
            seat:Sit(hum)
            task.wait(0.2)
            Event:FireServer("Teleport", {"Harbour", ""})
        end)
    end)

    -- ===== MOVEMENT =====
    local speedOn = false
    local walkSpeedVal = 48
    local flySpeedVal = 80

    createToggle(pages["movement"], t("speed"), t("speedDesc"), 5, function(on)
        speedOn = on
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = on and walkSpeedVal or 16
        end
    end)

    createSlider(pages["movement"], "Speed Value", "Ajusta la velocidad de marcha", 65, 16, 250, 48, function(v)
        walkSpeedVal = v
        if speedOn and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = v
        end
    end)

    local infJump = false
    createToggle(pages["movement"], t("jump"), t("jumpDesc"), 133, function(on)
        infJump = on
    end)
    UserInputService.JumpRequest:Connect(function()
        if infJump and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    -- // VUELO CFRAME REESCRITO (100% LIBRE DE BUGS MÓVILES) //
    local flyOn = false
    local flyConnection = nil

    createToggle(pages["movement"], t("fly"), t("flyDesc"), 193, function(on)
        flyOn = on
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")

        if on and hrp and hum then
            hum:ChangeState(Enum.HumanoidStateType.Swimming)

            flyConnection = RunService.RenderStepped:Connect(function(deltaTime)
                if not flyOn or not hrp or not hum or not char:IsDescendantOf(workspace) then
                    if flyConnection then flyConnection:Disconnect() flyConnection = nil end
                    return
                end

                local cam = workspace.CurrentCamera
                local moveDir = hum.MoveDirection -- Palanca táctil nativa del celular

                -- Anula la gravedad del servidor para que no caiga
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero

                if moveDir.Magnitude > 0.1 then
                    local camCF = cam.CFrame
                    local lookVec = camCF.LookVector
                    local rightVec = camCF.RightVector

                    -- Calcula la dirección vectorial libre en 3D
                    local direction = (lookVec * -moveDir.Z + rightVec * moveDir.X).Unit
                    
                    -- Desplaza la posición vía CFrame
                    hrp.CFrame = hrp.CFrame + (direction * (flySpeedVal * deltaTime))
                end
            end)
        else
            if flyConnection then
                flyConnection:Disconnect()
                flyConnection = nil
            end
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
        end
    end)

    createSlider(pages["movement"], t("flySpeed"), t("flySpeedDesc"), 253, 20, 250, 80, function(v)
        flySpeedVal = v
    end)

    -- ===== TELEPORTS =====
    createButton(pages["teleports"], t("harbour"), t("tpDesc"), 5, Color3.fromRGB(0, 230, 160), function()
        Event:FireServer("Teleport", {"Harbour", ""})
    end)
    createButton(pages["teleports"], t("islandA"), t("tpDesc"), 60, Color3.fromRGB(0, 150, 255), function()
        Event:FireServer("Teleport", {"Island", "A", 0})
    end)
    createButton(pages["teleports"], t("islandB"), t("tpDesc"), 115, Color3.fromRGB(0, 150, 255), function()
        Event:FireServer("Teleport", {"Island", "B", 0})
    end)
    createButton(pages["teleports"], t("islandC"), t("tpDesc"), 170, Color3.fromRGB(0, 150, 255), function()
        Event:FireServer("Teleport", {"Island", "C", 0})
    end)
    createButton(pages["teleports"], t("carrier"), t("tpDesc"), 225, Color3.fromRGB(240, 140, 40), function()
        Event:FireServer("Teleport", {"Carrier", "", 0})
    end)
    createButton(pages["teleports"], t("battleship"), t("tpDesc"), 280, Color3.fromRGB(160, 90, 240), function()
        Event:FireServer("Teleport", {"Battleship", "", 0})
    end)

    -- ===== SETTINGS =====
    createButton(pages["settings"], "Español", "Cambiar idioma a Español", 5, Color3.fromRGB(0, 150, 255), function()
        lang = "ES"
    end)
end
