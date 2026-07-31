--[[
    ================================================================
    [ SCRIPT INFORMATION ]
    Project: Custom Script
    Author: OYB
    YouTube: https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ
    
    [ TERMS AND CONDITIONS ]
    - You ARE allowed to use and modify this script for your own games.
    - You ARE NOT allowed to re-upload, redistribute, or claim 
      ownership of this script.
    - Removing or altering these credits is strictly prohibited.
    
    Copyright (c) 2026 OYB. All rights reserved.
    ================================================================
]]

-- ⚠️ IMPORTANT: Put this code at the VERY TOP of your Main Script (before obfuscating) ⚠️

local ProtectionConfig = {
    -- 🔴 CRITICAL: This MUST exactly match the 'Secret' value in your Key System's Config!
    -- If your Key System has: Secret = "Test"
    -- Then this must also be: SecretKey = "Test"
    SecretKey = "49032246",
    
    -- The name of your Hub (shown in the kick message if they try to bypass)
    HubName = "SexyBoy Hub"
}

-- Anti-Bypass Logic: Checks if the Key System successfully set the global variable
if not _G[ProtectionConfig.SecretKey] then
    local player = game:GetService("Players").LocalPlayer
    if player then
        player:Kick("\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
    end
    return -- Stops the rest of the script from loading!
end

-------------------------------------------------------------------------------
-- 👇 YOUR MAIN SCRIPT CODE STARTS HERE 👇
-------------------------------------------------------------------------------

print(ProtectionConfig.HubName .. " Loaded Successfully!")


-- // SexyBoy Hub v6.0 - Actualizacion, Nuevos Botones
-- // Animaciones Fluidas, Sonidos SFX, ESP Claro e Ícono Personalizado

local player = game.Players.LocalPlayer
local Event = game:GetService("ReplicatedStorage"):WaitForChild("Event")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

-- Configuración de Ícono Personalizado (Puedes cambiar el ID por el tuyo de Roblox)
local ICON_ASSET_ID = "rbxassetid://6031075931" 

-- Destruir interfaz previa si existe
local oldGui = player:WaitForChild("PlayerGui"):FindFirstChild("SexyBoyHub")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SexyBoyHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

local lang = "ES"

-- ==================== SISTEMA DE SONIDOS (SFX) ====================
local function playSound(soundId, volume, pitch)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. tostring(soundId)
    sound.Volume = volume or 0.5
    sound.Pitch = pitch or 1
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function() sound:Destroy() end)
end

local SFX = {
    Click = function() playSound(6895079853, 0.4, 1.2) end,
    Success = function() playSound(6022202230, 0.6, 1) end,
    Error = function() playSound(138090596, 0.5, 1) end,
    Loading = function() playSound(9069609268, 0.3, 1) end,
    OpenHub = function() playSound(2865227271, 0.5, 1.1) end
}

local T = {
    ES = {
        title = "SEXYBOY",
        subtitle = "HUB VIP v6.0",
        combat = "Combate",
        movement = "Movimiento",
        teleports = "Teleports",
        sabotage = "Sabotage",
        visual = "Visual",
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
        flyDesc = "Vuelo fluido guiado por la mira y joystick",
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
        
        -- Sabotage Texts
        sabTurretsJP = "Sabotage Turrets (Japan)",
        sabTurretsJPDesc = "Sabotear Torretas Equipo Japón",
        sabCannonsJP = "Sabotage Cannons (Japan)",
        sabCannonsJPDesc = "Sabotear Cañones Equipo Japón",
        sabTurretsUSA = "Sabotage Turrets (USA)",
        sabTurretsUSADesc = "Sabotear Torretas Equipo USA",
        sabCannonsUSA = "Sabotage Cannons (USA)",
        sabCannonsUSADesc = "Sabotear Cañones Equipo USA (FIX)",

        -- Visual Texts (Mejorados)
        planesESP = "ESP Aviones",
        planesESPDesc = "Muestra la ubicación y silueta de los aviones a larga distancia.",
        playersESP = "ESP Jugadores",
        playersESPDesc = "Resalta a todos los jugadores en el mapa con el color de su equipo."
    },
    EN = {
        title = "SEXYBOY",
        subtitle = "HUB VIP v6.0",
        combat = "Combat",
        movement = "Movement",
        teleports = "Teleports",
        sabotage = "Sabotage",
        visual = "Visual",
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
        flyDesc = "Smooth flight guided by camera and joystick",
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

        -- Sabotage Texts
        sabTurretsJP = "Sabotage Turrets (Japan)",
        sabTurretsJPDesc = "Sabotage Japan Team Turrets",
        sabCannonsJP = "Sabotage Cannons (Japan)",
        sabCannonsJPDesc = "Sabotage Japan Team Cannons",
        sabTurretsUSA = "Sabotage Turrets (USA)",
        sabTurretsUSADesc = "Sabotage USA Team Turrets",
        sabCannonsUSA = "Sabotage Cannons (USA)",
        sabCannonsUSADesc = "Sabotage USA Team Cannons (FIX)",

        -- Visual Texts
        planesESP = "Planes ESP",
        planesESPDesc = "Shows location and outline of planes at long distances.",
        playersESP = "Players ESP",
        playersESPDesc = "Highlights all players on the map using their team color."
    }
}

local function t(key)
    return T[lang][key] or key
end

-- ==================== SISTEMA VISUAL (ESP) ====================
local VisualSettings = {
    PlanesESP = false,
    PlayersESP = false,
    PlanesColor = Color3.fromRGB(255, 170, 0)
}

local TargetPartNames = {
    ["Propeller"] = true, ["Nose"] = true, ["BackWing"] = true,
    ["Wing"] = true, ["BackBody"] = true, ["Window"] = true, ["Tail"] = true
}

local ESPFolder = Workspace:FindFirstChild("Hub_ESP_Storage") or Instance.new("Folder")
ESPFolder.Name = "Hub_ESP_Storage"
ESPFolder.Parent = Workspace

local function applyHighlight(partOrModel, color)
    if not partOrModel or partOrModel:FindFirstChild("ESP_Highlight") then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.Adornee = partOrModel
    highlight.FillColor = color
    highlight.FillTransparency = 0.4
    highlight.OutlineColor = color
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = ESPFolder
    
    partOrModel.Destroying:Connect(function()
        if highlight then highlight:Destroy() end
    end)
end

local function checkAndApplyPartESP(part)
    if VisualSettings.PlanesESP and part:IsA("BasePart") and TargetPartNames[part.Name] then
        applyHighlight(part, VisualSettings.PlanesColor)
    end
end

Workspace.DescendantAdded:Connect(function(descendant)
    if VisualSettings.PlanesESP then
        checkAndApplyPartESP(descendant)
    end
end)

RunService.Stepped:Connect(function()
    if VisualSettings.PlanesESP then
        for _, descendant in pairs(Workspace:GetChildren()) do
            checkAndApplyPartESP(descendant)
        end
    end

    if VisualSettings.PlayersESP then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local teamColor = plr.TeamColor and plr.TeamColor.Color or Color3.fromRGB(255, 255, 255)
                applyHighlight(plr.Character, teamColor)
            end
        end
    end
end)

local blur = Instance.new("BlurEffect")
blur.Size = 18
blur.Parent = Lighting

-- ==================== BOTÓN FLOTANTE PERSONALIZADO ====================
local floatBtn = Instance.new("ImageButton")
floatBtn.Size = UDim2.new(0, 52, 0, 52)
floatBtn.Position = UDim2.new(1, -70, 0.5, -26)
floatBtn.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
floatBtn.Image = ICON_ASSET_ID
floatBtn.Visible = false
floatBtn.Parent = screenGui

Instance.new("UICorner", floatBtn).CornerRadius = UDim.new(1, 0)
local floatStroke = Instance.new("UIStroke", floatBtn)
floatStroke.Color = Color3.fromRGB(0, 230, 160)
floatStroke.Thickness = 2

floatBtn.Active = true
floatBtn.Draggable = true

-- ==================== PANTALLA DE CARGA CON ANIMACIÓN Y SONIDO ====================
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 340, 0, 190)
loadingFrame.Position = UDim2.new(0.5, -170, 0.5, -95)
loadingFrame.BackgroundColor3 = Color3.fromRGB(13, 15, 20)
loadingFrame.Parent = screenGui

Instance.new("UICorner", loadingFrame).CornerRadius = UDim.new(0, 14)
local loadStroke = Instance.new("UIStroke", loadingFrame)
loadStroke.Color = Color3.fromRGB(30, 35, 48)

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
    SFX.Loading()
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
    
    -- Animación de salida de Carga
    TweenService:Create(loadingFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    task.wait(0.4)
    loadingFrame:Destroy()
    showLogin()
end)

-- ==================== PANTALLA DE LOGIN CON ANIMACIONES & SFX ====================
function showLogin()
    local loginFrame = Instance.new("Frame")
    loginFrame.Size = UDim2.new(0, 0, 0, 0)
    loginFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    loginFrame.BackgroundColor3 = Color3.fromRGB(13, 15, 20)
    loginFrame.ClipsDescendants = true
    loginFrame.Parent = screenGui

    Instance.new("UICorner", loginFrame).CornerRadius = UDim.new(0, 14)
    local lStroke = Instance.new("UIStroke", loginFrame)
    lStroke.Color = Color3.fromRGB(30, 35, 48)

    -- Animación de Entrada
    TweenService:Create(loginFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 320, 0, 280),
        Position = UDim2.new(0.5, -160, 0.5, -140)
    }):Play()

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

    local function createInput(placeholder, y)
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

        box.Focused:Connect(function()
            SFX.Click()
            TweenService:Create(bStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 230, 160)}):Play()
        end)
        box.FocusLost:Connect(function()
            TweenService:Create(bStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(35, 40, 52)}):Play()
        end)

        return box
    end

    local userBox = createInput("Usuario", 82)
    local passBox = createInput("Contraseña", 136)

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
            SFX.Success()
            lSub.Text = "¡Acceso Concedido!"
            lSub.TextColor3 = Color3.fromRGB(0, 230, 160)

            -- Animación de Cierre Exitoso
            TweenService:Create(loginFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }):Play()
            
            if blur then blur:Destroy() end
            task.wait(0.45)
            loginFrame:Destroy()
            createHub()
        else
            SFX.Error()
            userBox.Text = ""
            passBox.Text = ""
            lSub.Text = "Credenciales incorrectas"
            lSub.TextColor3 = Color3.fromRGB(245, 80, 80)

            -- Animación de Sacudida (Shake) si falla
            local origPos = UDim2.new(0.5, -160, 0.5, -140)
            for i = 1, 3 do
                TweenService:Create(loginFrame, TweenInfo.new(0.05), {Position = origPos + UDim2.new(0, 10, 0, 0)}):Play()
                task.wait(0.05)
                TweenService:Create(loginFrame, TweenInfo.new(0.05), {Position = origPos - UDim2.new(0, 10, 0, 0)}):Play()
                task.wait(0.05)
            end
            TweenService:Create(loginFrame, TweenInfo.new(0.05), {Position = origPos}):Play()
        end
    end)
end

-- ==================== UI BUILDERS (CON SFX) ====================
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
        SFX.Click()
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
            SFX.Click()
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

    btn.MouseButton1Click:Connect(function()
        SFX.Click()
        callback()
    end)
    return btn
end

-- ==================== MAIN HUB (CON ANIMACIÓN DE APERTURA) ====================
function createHub()
    if mainFrame then mainFrame:Destroy() end

    SFX.OpenHub()

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 0, 0, 0)
    main.Position = UDim2.new(0.5, 0, 0.5, 0)
    main.BackgroundColor3 = Color3.fromRGB(13, 15, 20)
    main.Active = true
    main.Draggable = true
    main.ClipsDescendants = true
    main.Parent = screenGui
    
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
    local mStroke = Instance.new("UIStroke", main)
    mStroke.Color = Color3.fromRGB(30, 35, 48)
    mainFrame = main

    -- Animación de Aparición Fluida del Hub
    TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 510, 0, 360),
        Position = UDim2.new(0.5, -255, 0.5, -180)
    }):Play()

    floatBtn.Visible = false

    -- Sidebar Left
    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 145, 1, 0)
    sidebar.BackgroundColor3 = Color3.fromRGB(17, 19, 26)
    sidebar.Parent = main
    Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

    local brand = Instance.new("TextLabel")
    brand.Size = UDim2.new(1, -16, 0, 22)
    brand.Position = UDim2.new(0, 12, 0, 12)
    brand.BackgroundTransparency = 1
    brand.Text = t("title")
    brand.TextColor3 = Color3.fromRGB(255, 255, 255)
    brand.TextSize = 15
    brand.Font = Enum.Font.GothamBold
    brand.TextXAlignment = Enum.TextXAlignment.Left
    brand.Parent = sidebar

    local brandSub = Instance.new("TextLabel")
    brandSub.Size = UDim2.new(1, -16, 0, 14)
    brandSub.Position = UDim2.new(0, 12, 0, 30)
    brandSub.BackgroundTransparency = 1
    brandSub.Text = t("subtitle")
    brandSub.TextColor3 = Color3.fromRGB(0, 230, 160)
    brandSub.TextSize = 9
    brandSub.Font = Enum.Font.GothamBold
    brandSub.TextXAlignment = Enum.TextXAlignment.Left
    brandSub.Parent = sidebar

    -- Perfil & Leaderstats
    local profileCard = Instance.new("Frame")
    profileCard.Size = UDim2.new(1, -16, 0, 80)
    profileCard.Position = UDim2.new(0, 8, 1, -88)
    profileCard.BackgroundColor3 = Color3.fromRGB(22, 26, 36)
    profileCard.Parent = sidebar
    Instance.new("UICorner", profileCard).CornerRadius = UDim.new(0, 8)

    local avatarImg = Instance.new("ImageLabel")
    avatarImg.Size = UDim2.new(0, 32, 0, 32)
    avatarImg.Position = UDim2.new(0, 6, 0, 6)
    avatarImg.BackgroundTransparency = 1
    avatarImg.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    avatarImg.Parent = profileCard
    Instance.new("UICorner", avatarImg).CornerRadius = UDim.new(1, 0)

    local nameLbl = Instance.new("TextLabel")
    nameLbl.Size = UDim2.new(1, -46, 0, 16)
    nameLbl.Position = UDim2.new(0, 42, 0, 6)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = player.DisplayName
    nameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLbl.TextSize = 10
    nameLbl.Font = Enum.Font.GothamBold
    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
    nameLbl.Parent = profileCard

    local statsLbl = Instance.new("TextLabel")
    statsLbl.Size = UDim2.new(1, -10, 0, 36)
    statsLbl.Position = UDim2.new(0, 6, 0, 40)
    statsLbl.BackgroundTransparency = 1
    statsLbl.Text = "Coins: ... | Score: ...\nWins: ..."
    statsLbl.TextColor3 = Color3.fromRGB(0, 230, 160)
    statsLbl.TextSize = 9
    statsLbl.Font = Enum.Font.GothamMedium
    statsLbl.TextXAlignment = Enum.TextXAlignment.Left
    statsLbl.TextYAlignment = Enum.TextYAlignment.Top
    statsLbl.Parent = profileCard

    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                local ls = player:FindFirstChild("leaderstats")
                if ls then
                    local coin = ls:FindFirstChild("Coin") and ls.Coin.Value or 0
                    local score = ls:FindFirstChild("Score") and ls.Score.Value or 0
                    local win = ls:FindFirstChild("Win") and ls.Win.Value or 0
                    statsLbl.Text = string.format("Coins: %d | Score: %d\nWins: %d", coin, score, win)
                end
            end)
        end
    end)

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
        SFX.Click()
        main.Visible = false
        floatBtn.Visible = true
    end)

    floatBtn.MouseButton1Click:Connect(function()
        SFX.Click()
        main.Visible = true
        floatBtn.Visible = false
    end)

    -- Navigation Tabs
    local pages, tabBtns = {}, {}
    local tabNames = {"combat", "movement", "teleports", "sabotage", "visual", "settings"}
    local tabLabels = {t("combat"), t("movement"), t("teleports"), t("sabotage"), t("visual"), t("settings")}

    local tabHolder = Instance.new("Frame")
    tabHolder.Size = UDim2.new(1, -16, 1, -150)
    tabHolder.Position = UDim2.new(0, 8, 0, 50)
    tabHolder.BackgroundTransparency = 1
    tabHolder.Parent = sidebar

    for i, key in ipairs(tabNames) do
        local tab = Instance.new("TextButton")
        tab.Size = UDim2.new(1, 0, 0, 26)
        tab.Position = UDim2.new(0, 0, 0, (i-1) * 28)
        tab.BackgroundColor3 = (i == 1) and Color3.fromRGB(24, 28, 38) or Color3.fromRGB(0, 0, 0)
        tab.BackgroundTransparency = (i == 1) and 0 or 1
        tab.Text = "  " .. tabLabels[i]
        tab.TextColor3 = (i == 1) and Color3.fromRGB(0, 230, 160) or Color3.fromRGB(120, 125, 140)
        tab.TextSize = 10
        tab.Font = Enum.Font.GothamSemibold
        tab.TextXAlignment = Enum.TextXAlignment.Left
        tab.Parent = tabHolder
        Instance.new("UICorner", tab).CornerRadius = UDim.new(0, 6)

        local page = Instance.new("ScrollingFrame")
        page.Size = UDim2.new(1, -160, 1, -50)
        page.Position = UDim2.new(0, 152, 0, 44)
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 2
        page.ScrollBarImageColor3 = Color3.fromRGB(40, 45, 60)
        page.CanvasSize = UDim2.new(0, 0, 0, 360)
        page.Visible = (i == 1)
        page.Parent = main

        pages[key] = page
        tabBtns[key] = tab

        tab.MouseButton1Click:Connect(function()
            SFX.Click()
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
                local moveDir = hum.MoveDirection

                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero

                if moveDir.Magnitude > 0.1 then
                    local camCF = cam.CFrame
                    local lookVec = camCF.LookVector
                    local rightVec = camCF.RightVector
                    local direction = (lookVec * -moveDir.Z + rightVec * moveDir.X).Unit
                    hrp.CFrame = hrp.CFrame + (direction * (flySpeedVal * deltaTime))
                end
            end)
        else
            if flyConnection then flyConnection:Disconnect() flyConnection = nil end
            if hum then hum:ChangeState(Enum.HumanoidStateType.GettingUp) end
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

    -- ===== SABOTAGE =====
    local baseCFrame = CFrame.new(313, 1145, -8136)
    local isSabotageBusy = false

    local function tpToCFrame(targetCFrame)
        local char = player.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        
        if hum and hum.SeatPart then
            local seat = hum.SeatPart
            if seat.AssemblyRootPart then seat.AssemblyRootPart.CFrame = targetCFrame
            elseif seat:IsA("BasePart") then seat.CFrame = targetCFrame end
        elseif hrp then hrp.CFrame = targetCFrame end
    end

    local function forceRealJump()
        local char = player.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        
        if hum and hum.Sit then hum.Sit = false task.wait(0.1) end
        if hum and hrp then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
            hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 50, hrp.AssemblyLinearVelocity.Z)
        end
        task.wait(1)
    end

    createButton(pages["sabotage"], t("sabTurretsJP"), t("sabTurretsJPDesc"), 5, Color3.fromRGB(220, 60, 60), function()
        if isSabotageBusy then return end
        isSabotageBusy = true
        task.spawn(function()
            local targetPositions = {
                CFrame.new(0, 24, -8144),
                CFrame.new(101, 24, -8143),
                CFrame.new(-100, 24, -8145)
            }
            for _, posCFrame in ipairs(targetPositions) do
                pcall(function()
                    local char = player.Character
                    if not char then return end
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    
                    tpToCFrame(posCFrame)
                    if hum then hum:Move(Vector3.new(0, 0, -1), true) end
                    task.wait(3)
                    if hum then hum:Move(Vector3.new(0, 0, 0), true) end
                    
                    tpToCFrame(baseCFrame)
                    task.wait(2)
                    forceRealJump()
                end)
            end
            pcall(function() tpToCFrame(CFrame.new(-0, 23, -8158)) end)
            isSabotageBusy = false
        end)
    end)

    createButton(pages["sabotage"], t("sabCannonsJP"), t("sabCannonsJPDesc"), 60, Color3.fromRGB(230, 120, 30), function()
        if isSabotageBusy then return end
        isSabotageBusy = true
        task.spawn(function()
            local targetPositions = {
                CFrame.new(-150, 22, -7987),
                CFrame.new(150, 22, -7987)
            }
            for _, posCFrame in ipairs(targetPositions) do
                pcall(function()
                    local char = player.Character
                    if not char then return end
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    
                    tpToCFrame(posCFrame)
                    if hum then hum:Move(Vector3.new(0, 0, -1), true) end
                    task.wait(3)
                    if hum then hum:Move(Vector3.new(0, 0, 0), true) end
                    
                    tpToCFrame(baseCFrame)
                    task.wait(2)
                    forceRealJump()
                end)
            end
            pcall(function() tpToCFrame(CFrame.new(-0, 23, -8158)) end)
            isSabotageBusy = false
        end)
    end)

    createButton(pages["sabotage"], t("sabTurretsUSA"), t("sabTurretsUSADesc"), 115, Color3.fromRGB(40, 120, 220), function()
        if isSabotageBusy then return end
        isSabotageBusy = true
        task.spawn(function()
            local targetPositions = {
                CFrame.new(-100, 24, 8144),
                CFrame.new(100, 24, 8144),
                CFrame.new(0, 24, 8144)
            }
            for _, posCFrame in ipairs(targetPositions) do
                pcall(function()
                    local char = player.Character
                    if not char then return end
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    
                    tpToCFrame(posCFrame)
                    if hum then hum:Move(Vector3.new(0, 0, -1), true) end
                    task.wait(3)
                    if hum then hum:Move(Vector3.new(0, 0, 0), true) end
                    
                    tpToCFrame(baseCFrame)
                    task.wait(2)
                    forceRealJump()
                end)
            end
            pcall(function() tpToCFrame(CFrame.new(-0, 23, 8176)) end)
            isSabotageBusy = false
        end)
    end)

    createButton(pages["sabotage"], t("sabCannonsUSA"), t("sabCannonsUSADesc"), 170, Color3.fromRGB(130, 60, 200), function()
        if isSabotageBusy then return end
        isSabotageBusy = true
        task.spawn(function()
            local targetPositions = {
                CFrame.new(150, 22, 7987),
                CFrame.new(-150, 22, 7987)
            }
            for _, posCFrame in ipairs(targetPositions) do
                pcall(function()
                    local char = player.Character
                    if not char then return end
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    
                    tpToCFrame(posCFrame)
                    if hum then hum:Move(Vector3.new(0, 0, -1), true) end
                    task.wait(3)
                    if hum then hum:Move(Vector3.new(0, 0, 0), true) end
                    
                    tpToCFrame(baseCFrame)
                    task.wait(2)
                    forceRealJump()
                end)
            end
            pcall(function() tpToCFrame(CFrame.new(-0, 23, 8176)) end)
            isSabotageBusy = false
        end)
    end)

    pages["sabotage"].CanvasSize = UDim2.new(0, 0, 0, 230)

    -- ===== VISUAL =====
    createToggle(pages["visual"], t("planesESP"), t("planesESPDesc"), 5, function(on)
        VisualSettings.PlanesESP = on
    end)

    createToggle(pages["visual"], t("playersESP"), t("playersESPDesc"), 65, function(on)
        VisualSettings.PlayersESP = on
    end)

    pages["visual"].CanvasSize = UDim2.new(0, 0, 0, 130)

    -- ===== SETTINGS =====
    createButton(pages["settings"], t("language"), t("langDesc"), 5, Color3.fromRGB(0, 230, 160), function()
        lang = (lang == "ES") and "EN" or "ES"
        createHub()
    end)
end
