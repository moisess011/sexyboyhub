-- [[ SEXYBOY HUB v3.3 ]]
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

local oldGui = playerGui:FindFirstChild("SexyBoyHubGUI")
if oldGui then oldGui:Destroy() end

local combatFolder = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Combat")
local mercHitClaim = combatFolder:WaitForChild("MercHitClaim")
local weaponFired = combatFolder:WaitForChild("WeaponFired")

local WEAPON_NAME = "Rattler"
local killAuraActivo = false
local killAuraRango = 35
local walkSpeedValor = 16
local infJumpActivo = false
local espActivo = false
local espMostrarNombres = true
local espColorActual = Color3.fromRGB(255, 60, 120)
local lang = "ES"
local selectedTargets = {}
local descLabels = {}

local DESC = {
    ES = {
        killAura = "Compatible solo con Rattler (arma principiante)",
        rango = "Rango en Studs",
        killAll = "Mata a todos de una vez",
        kill = "Elegi jugadores y matalos",
        refresh = "Actualizar lista de jugadores",
        infJump = "Salta continuamente en el aire",
        speed = "Ajusta la velocidad del personaje",
        esp = "Resalta enemigos a traves de muros",
        names = "Muestra nombres sobre objetivos",
        langES = "Cambiar descripciones a espanol",
        langEN = "Cambiar descripciones a ingles",
        infoTitle = "Importante",
        infoBody = "Las funciones KillAura, Kill All y Kill Player solo funcionan cuando tenes el arma Rattler equipada en la mano.\n\nRattler es el arma de principiante del juego.\n\nProximamente va a haber KillAura y kills para todas las armas.\n\nPor ahora disfruten el KillAura y los Kill All.\n\nQue se diviertan.",
    },
    EN = {
        killAura = "Only compatible with Rattler (starter weapon)",
        rango = "Range in Studs",
        killAll = "Kill everyone at once",
        kill = "Select players and kill them",
        refresh = "Refresh player list",
        infJump = "Jump continuously in the air",
        speed = "Adjust character walk speed",
        esp = "Highlight enemies through walls",
        names = "Show names over targets",
        langES = "Switch descriptions to Spanish",
        langEN = "Switch descriptions to English",
        infoTitle = "Important",
        infoBody = "KillAura, Kill All and Kill Player only work when you have the Rattler weapon equipped in your hand.\n\nRattler is the starter weapon of the game.\n\nSoon there will be KillAura and kills for all weapons.\n\nFor now enjoy KillAura and Kill All.\n\nHave fun.",
    }
}

local function d(key)
    return DESC[lang][key] or key
end

local function updateAllDescs()
    for key, label in pairs(descLabels) do
        if label and label.Parent then
            label.Text = d(key)
        end
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SexyBoyHubGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

local floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 48, 0, 48)
floatBtn.Position = UDim2.new(1, -65, 0.5, -24)
floatBtn.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
floatBtn.Text = "SB"
floatBtn.TextColor3 = Color3.fromRGB(255, 60, 120)
floatBtn.TextSize = 16
floatBtn.Font = Enum.Font.GothamBold
floatBtn.Visible = false
floatBtn.Parent = ScreenGui
Instance.new("UICorner", floatBtn).CornerRadius = UDim.new(0, 12)
local floatStroke = Instance.new("UIStroke", floatBtn)
floatStroke.Color = Color3.fromRGB(255, 60, 120)
floatStroke.Thickness = 1.5
floatBtn.Active = true
floatBtn.Draggable = true

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 400)
main.Position = UDim2.new(0.5, -250, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(13, 15, 20)
main.Active = true
main.Draggable = true
main.Parent = ScreenGui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", main).Color = Color3.fromRGB(30, 35, 48)

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 130, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(17, 19, 26)
sidebar.Parent = main
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

local brand = Instance.new("TextLabel")
brand.Size = UDim2.new(1, -16, 0, 22)
brand.Position = UDim2.new(0, 12, 0, 16)
brand.BackgroundTransparency = 1
brand.Text = "SEXYBOY"
brand.TextColor3 = Color3.fromRGB(255, 255, 255)
brand.TextSize = 15
brand.Font = Enum.Font.GothamBold
brand.TextXAlignment = Enum.TextXAlignment.Left
brand.Parent = sidebar

local brandSub = Instance.new("TextLabel")
brandSub.Size = UDim2.new(1, -16, 0, 14)
brandSub.Position = UDim2.new(0, 12, 0, 36)
brandSub.BackgroundTransparency = 1
brandSub.Text = "HUB v3.3"
brandSub.TextColor3 = Color3.fromRGB(255, 60, 120)
brandSub.TextSize = 9
brandSub.Font = Enum.Font.GothamBold
brandSub.TextXAlignment = Enum.TextXAlignment.Left
brandSub.Parent = sidebar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 26, 0, 26)
closeBtn.Position = UDim2.new(1, -34, 0, 12)
closeBtn.BackgroundColor3 = Color3.fromRGB(22, 25, 34)
closeBtn.Text = "X"
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

local function createToggle(parent, name, descKey, y, callback)
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
    descL.Text = d(descKey)
    descL.TextColor3 = Color3.fromRGB(110, 115, 130)
    descL.TextSize = 10
    descL.Font = Enum.Font.Gotham
    descL.TextXAlignment = Enum.TextXAlignment.Left
    descL.Parent = row
    descLabels[descKey] = descL

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
            BackgroundColor3 = state and Color3.fromRGB(255, 60, 120) or Color3.fromRGB(35, 40, 52)
        }):Play()
        TweenService:Create(circle, TweenInfo.new(0.18), {
            Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        }):Play()
        callback(state)
    end)
end

local function createSlider(parent, name, descKey, y, minVal, maxVal, defaultVal, callback)
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
    valLbl.TextColor3 = Color3.fromRGB(255, 60, 120)
    valLbl.TextSize = 12
    valLbl.Font = Enum.Font.GothamBold
    valLbl.TextXAlignment = Enum.TextXAlignment.Right
    valLbl.Parent = row

    local descL = Instance.new("TextLabel")
    descL.Size = UDim2.new(1, -24, 0, 14)
    descL.Position = UDim2.new(0, 12, 0, 24)
    descL.BackgroundTransparency = 1
    descL.Text = d(descKey)
    descL.TextColor3 = Color3.fromRGB(110, 115, 130)
    descL.TextSize = 10
    descL.Parent = row
    descLabels[descKey] = descL

    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(1, -24, 0, 6)
    sliderBg.Position = UDim2.new(0, 12, 0, 44)
    sliderBg.BackgroundColor3 = Color3.fromRGB(35, 40, 52)
    sliderBg.Parent = row
    Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(1, 0)

    local sliderFill = Instance.new("Frame")
    local initRatio = (defaultVal - minVal) / (maxVal - minVal)
    sliderFill.Size = UDim2.new(initRatio, 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 60, 120)
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
end

local function createButton(parent, name, descKey, y, color, callback)
    local row = Instance.new("TextButton")
    row.Size = UDim2.new(1, -20, 0, 54)
    row.Position = UDim2.new(0, 10, 0, y)
    row.BackgroundColor3 = color
    row.Text = ""
    row.Parent = parent
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -16, 0, 22)
    label.Position = UDim2.new(0, 12, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 13
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = row

    local descL = Instance.new("TextLabel")
    descL.Size = UDim2.new(1, -16, 0, 16)
    descL.Position = UDim2.new(0, 12, 0, 28)
    descL.BackgroundTransparency = 1
    descL.Text = d(descKey)
    descL.TextColor3 = Color3.fromRGB(200, 200, 210)
    descL.TextSize = 10
    descL.Font = Enum.Font.Gotham
    descL.TextXAlignment = Enum.TextXAlignment.Left
    descL.Parent = row
    descLabels[descKey] = descL

    row.MouseButton1Click:Connect(callback)
end

local function killPlayer(targetPlayer)
    local myChar = localPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return end
    local myPos = myChar.HumanoidRootPart.Position
    local targetChar = targetPlayer.Character
    if not targetChar then return end
    local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
    local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHumanoid or targetHumanoid.Health <= 0 or not targetHrp then return end

    local head = targetChar:FindFirstChild("Head") or targetChar:FindFirstChild("UpperTorso") or targetHrp
    local headPos = head.Position
    local direction = (headPos - myPos).Unit

    weaponFired:FireServer(WEAPON_NAME, myPos, direction)
    for i = 1, 3 do
        mercHitClaim:FireServer(WEAPON_NAME, targetPlayer.UserId, "Head", headPos, direction, myPos, 100)
    end
end

local function executeKillAll()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= localPlayer then
            killPlayer(plr)
        end
    end
end

-- Tabs
local pages, tabBtns = {}, {}
local tabNames = {"combat", "movement", "visual", "settings", "info"}
local tabLabels = {"Combat", "Movement", "Visual", "Settings", "Info"}

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
    tab.TextColor3 = (i == 1) and Color3.fromRGB(255, 60, 120) or Color3.fromRGB(120, 125, 140)
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
    page.ScrollBarImageColor3 = Color3.fromRGB(255, 60, 120)
    page.CanvasSize = UDim2.new(0, 0, 0, 520)
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
            tabBtns[k].TextColor3 = isTarget and Color3.fromRGB(255, 60, 120) or Color3.fromRGB(120, 125, 140)
        end
    end)
end

--------------------------------------------------------------------------------
-- COMBAT
--------------------------------------------------------------------------------
createToggle(pages["combat"], "Kill Aura", "killAura", 5, function(val)
    killAuraActivo = val
end)

createSlider(pages["combat"], "Rango Kill Aura", "rango", 65, 10, 100, killAuraRango, function(val)
    killAuraRango = val
end)

createButton(pages["combat"], "Kill All", "killAll", 135, Color3.fromRGB(180, 40, 60), function()
    executeKillAll()
end)

local listFrame = Instance.new("Frame")
listFrame.Size = UDim2.new(1, -20, 0, 160)
listFrame.Position = UDim2.new(0, 10, 0, 200)
listFrame.BackgroundColor3 = Color3.fromRGB(20, 23, 31)
listFrame.Parent = pages["combat"]
Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 8)

local listTitle = Instance.new("TextLabel")
listTitle.Size = UDim2.new(1, -10, 0, 24)
listTitle.Position = UDim2.new(0, 8, 0, 4)
listTitle.BackgroundTransparency = 1
listTitle.Text = "Select Players"
listTitle.TextColor3 = Color3.fromRGB(200, 200, 210)
listTitle.TextSize = 12
listTitle.Font = Enum.Font.GothamSemibold
listTitle.TextXAlignment = Enum.TextXAlignment.Left
listTitle.Parent = listFrame

local scrollPlayers = Instance.new("ScrollingFrame")
scrollPlayers.Size = UDim2.new(1, -10, 1, -32)
scrollPlayers.Position = UDim2.new(0, 5, 0, 28)
scrollPlayers.BackgroundTransparency = 1
scrollPlayers.ScrollBarThickness = 2
scrollPlayers.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollPlayers.Parent = listFrame

local function refreshPlayerList()
    for _, c in pairs(scrollPlayers:GetChildren()) do
        if c:IsA("TextButton") then c:Destroy() end
    end
    selectedTargets = {}
    local y = 0
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= localPlayer then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -4, 0, 28)
            btn.Position = UDim2.new(0, 2, 0, y)
            btn.BackgroundColor3 = Color3.fromRGB(30, 34, 44)
            btn.Text = "  " .. plr.Name
            btn.TextColor3 = Color3.fromRGB(200, 200, 210)
            btn.TextSize = 12
            btn.Font = Enum.Font.Gotham
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Parent = scrollPlayers
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

            local selected = false
            btn.MouseButton1Click:Connect(function()
                selected = not selected
                if selected then
                    selectedTargets[plr] = true
                    btn.BackgroundColor3 = Color3.fromRGB(255, 60, 120)
                    btn.TextColor3 = Color3.new(1,1,1)
                else
                    selectedTargets[plr] = nil
                    btn.BackgroundColor3 = Color3.fromRGB(30, 34, 44)
                    btn.TextColor3 = Color3.fromRGB(200, 200, 210)
                end
            end)
            y = y + 32
        end
    end
    scrollPlayers.CanvasSize = UDim2.new(0, 0, 0, y)
end

refreshPlayerList()

createButton(pages["combat"], "Kill", "kill", 370, Color3.fromRGB(200, 60, 80), function()
    for plr, _ in pairs(selectedTargets) do
        if plr and plr.Parent then
            killPlayer(plr)
        end
    end
end)

createButton(pages["combat"], "Refresh List", "refresh", 430, Color3.fromRGB(50, 80, 120), function()
    refreshPlayerList()
end)

--------------------------------------------------------------------------------
-- MOVEMENT
--------------------------------------------------------------------------------
createToggle(pages["movement"], "Infinite Jump", "infJump", 5, function(val)
    infJumpActivo = val
end)

createSlider(pages["movement"], "WalkSpeed", "speed", 65, 16, 120, walkSpeedValor, function(val)
    walkSpeedValor = val
    local char = localPlayer.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid").WalkSpeed = walkSpeedValor
    end
end)

--------------------------------------------------------------------------------
-- VISUAL
--------------------------------------------------------------------------------
local espObjects = {}
local function limpiarESP()
    for _, obj in pairs(espObjects) do
        if obj and obj.Parent then obj:Destroy() end
    end
    espObjects = {}
end

local function actualizarESP()
    limpiarESP()
    if not espActivo then return end
    local mercFolder = workspace:FindFirstChild("MercPlayers")
    if not mercFolder then return end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            local hitboxModel = mercFolder:FindFirstChild("MercHitboxes_" .. player.Name)
            local visualModel = mercFolder:FindFirstChild("MercVisual_" .. player.Name)
            local targetModel = visualModel or hitboxModel
            if targetModel then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = targetModel
                highlight.FillColor = espColorActual
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.Parent = targetModel
                table.insert(espObjects, highlight)
                if espMostrarNombres then
                    local head = targetModel:FindFirstChild("Head") or targetModel:FindFirstChild("UpperTorso") or targetModel:FindFirstChildOfClass("Part")
                    if head then
                        local bb = Instance.new("BillboardGui")
                        bb.Adornee = head
                        bb.Size = UDim2.new(0, 150, 0, 30)
                        bb.StudsOffset = Vector3.new(0, 3, 0)
                        bb.AlwaysOnTop = true
                        local txt = Instance.new("TextLabel")
                        txt.Size = UDim2.new(1, 0, 1, 0)
                        txt.BackgroundTransparency = 1
                        txt.Text = player.Name
                        txt.TextColor3 = espColorActual
                        txt.Font = Enum.Font.GothamBold
                        txt.TextSize = 13
                        txt.TextStrokeTransparency = 0
                        txt.Parent = bb
                        bb.Parent = targetModel
                        table.insert(espObjects, bb)
                    end
                end
            end
        end
    end
end

createToggle(pages["visual"], "Tactical ESP", "esp", 5, function(val)
    espActivo = val
    actualizarESP()
end)

createToggle(pages["visual"], "Show Names", "names", 65, function(val)
    espMostrarNombres = val
    actualizarESP()
end)

local colorRow = Instance.new("Frame")
colorRow.Size = UDim2.new(1, -20, 0, 50)
colorRow.Position = UDim2.new(0, 10, 0, 125)
colorRow.BackgroundColor3 = Color3.fromRGB(20, 23, 31)
colorRow.Parent = pages["visual"]
Instance.new("UICorner", colorRow).CornerRadius = UDim.new(0, 8)

local colores = {
    Color3.fromRGB(255, 60, 120),
    Color3.fromRGB(255, 50, 50),
    Color3.fromRGB(50, 255, 120),
    Color3.fromRGB(50, 180, 255),
    Color3.fromRGB(255, 220, 50)
}
for i, col in ipairs(colores) do
    local colBtn = Instance.new("TextButton")
    colBtn.Size = UDim2.new(0, 36, 0, 26)
    colBtn.Position = UDim2.new(0.04 + (i - 1) * 0.19, 0, 0.5, -13)
    colBtn.BackgroundColor3 = col
    colBtn.Text = ""
    colBtn.Parent = colorRow
    Instance.new("UICorner", colBtn).CornerRadius = UDim.new(0, 6)
    colBtn.MouseButton1Click:Connect(function()
        espColorActual = col
        actualizarESP()
    end)
end

--------------------------------------------------------------------------------
-- SETTINGS
--------------------------------------------------------------------------------
createButton(pages["settings"], "Espanol", "langES", 5, Color3.fromRGB(50, 100, 180), function()
    lang = "ES"
    updateAllDescs()
end)

createButton(pages["settings"], "English", "langEN", 65, Color3.fromRGB(50, 100, 180), function()
    lang = "EN"
    updateAllDescs()
end)

--------------------------------------------------------------------------------
-- INFO
--------------------------------------------------------------------------------
local infoBox = Instance.new("Frame")
infoBox.Size = UDim2.new(1, -20, 0, 300)
infoBox.Position = UDim2.new(0, 10, 0, 10)
infoBox.BackgroundColor3 = Color3.fromRGB(20, 23, 31)
infoBox.Parent = pages["info"]
Instance.new("UICorner", infoBox).CornerRadius = UDim.new(0, 10)

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(1, -20, 0, 30)
infoTitle.Position = UDim2.new(0, 12, 0, 10)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = d("infoTitle")
infoTitle.TextColor3 = Color3.fromRGB(255, 60, 120)
infoTitle.TextSize = 16
infoTitle.Font = Enum.Font.GothamBold
infoTitle.TextXAlignment = Enum.TextXAlignment.Left
infoTitle.Parent = infoBox
descLabels["infoTitle"] = infoTitle

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, -24, 1, -50)
infoText.Position = UDim2.new(0, 12, 0, 45)
infoText.BackgroundTransparency = 1
infoText.Text = d("infoBody")
infoText.TextColor3 = Color3.fromRGB(200, 205, 215)
infoText.TextSize = 12
infoText.Font = Enum.Font.Gotham
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.TextWrapped = true
infoText.Parent = infoBox
descLabels["infoBody"] = infoText

--------------------------------------------------------------------------------
-- LOOPS
--------------------------------------------------------------------------------
UserInputService.JumpRequest:Connect(function()
    if infJumpActivo then
        local char = localPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

task.spawn(function()
    while task.wait(1.5) do
        if espActivo then actualizarESP() end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if not killAuraActivo then continue end
        local myChar = localPlayer.Character
        if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then continue end
        local myPos = myChar.HumanoidRootPart.Position
        for _, targetPlayer in ipairs(Players:GetPlayers()) do
            if targetPlayer ~= localPlayer and targetPlayer.Character then
                local targetChar = targetPlayer.Character
                local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
                local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
                if targetHrp and targetHumanoid and targetHumanoid.Health > 0 then
                    local distancia = (targetHrp.Position - myPos).Magnitude
                    if distancia <= killAuraRango then
                        killPlayer(targetPlayer)
                    end
                end
            end
        end
    end
end)

print("SexyBoy Hub v3.3 cargado")
