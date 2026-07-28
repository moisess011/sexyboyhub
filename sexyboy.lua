-- // SexyBoy Hub v4 - Cambios:
-- // HUB FLOTANTE
-- // IDIOMAS ESP/ENG
-- // Refresh Client Side
-- // Refresh Fe

local player = game.Players.LocalPlayer
local Event = game:GetService("ReplicatedStorage"):WaitForChild("Event")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SexyBoyHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

local lang = "ES" -- ES o EN

local T = {
    ES = {
        title = "SexyBoy Hub",
        combat = "Combate",
        movement = "Movimiento",
        teleports = "Teleports",
        settings = "Ajustes",
        killAura = "KillAura Rifle",
        killAuraDesc = "Dispara solo a enemigos cercanos",
        rpg = "Auto RPG",
        rpgDesc = "Lanza RPG a enemigos automáticamente",
        turret = "Torreta Predictiva",
        turretDesc = "Apunta y dispara a aviones",
        refresh = "Refresh",
        refreshDesc = "Va al Harbour y vuelve (ForceField)",
        refreshCS = "Refresh Client",
        refreshCSDesc = "ForceField sin moverte de lugar",
        speed = "Speed x3",
        speedDesc = "Aumenta tu velocidad de carrera",
        jump = "Salto Infinito",
        jumpDesc = "Salta sin tocar el suelo",
        fly = "Fly",
        flyDesc = "Vuela libremente por el mapa",
        harbour = "Harbour",
        islandA = "Island A",
        islandB = "Island B",
        islandC = "Island C",
        carrier = "Carrier",
        battleship = "Battleship",
        tpDesc = "Teletransportarte a esta zona",
        language = "Idioma",
        langDesc = "Cambiar idioma del hub",
    },
    EN = {
        title = "SexyBoy Hub",
        combat = "Combat",
        movement = "Movement",
        teleports = "Teleports",
        settings = "Settings",
        killAura = "KillAura Rifle",
        killAuraDesc = "Shoots nearby enemies only",
        rpg = "Auto RPG",
        rpgDesc = "Auto fires RPG at enemies",
        turret = "Predictive Turret",
        turretDesc = "Aims and shoots at planes",
        refresh = "Refresh",
        refreshDesc = "Goes to Harbour and back (FF)",
        refreshCS = "Refresh Client",
        refreshCSDesc = "ForceField without moving",
        speed = "Speed x3",
        speedDesc = "Increases your run speed",
        jump = "Infinite Jump",
        jumpDesc = "Jump without touching the ground",
        fly = "Fly",
        flyDesc = "Fly freely around the map",
        harbour = "Harbour",
        islandA = "Island A",
        islandB = "Island B",
        islandC = "Island C",
        carrier = "Carrier",
        battleship = "Battleship",
        tpDesc = "Teleport to this location",
        language = "Language",
        langDesc = "Change hub language",
    }
}

local function t(key)
    return T[lang][key] or key
end

local function playSound(id, vol)
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://" .. tostring(id)
    s.Volume = vol or 0.35
    s.Parent = SoundService
    s:Play()
    game:GetService("Debris"):AddItem(s, 2)
end

-- Floating icon (para reabrir)
local floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 55, 0, 55)
floatBtn.Position = UDim2.new(1, -75, 0.5, -27)
floatBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 130)
floatBtn.Text = "SB"
floatBtn.TextColor3 = Color3.new(1,1,1)
floatBtn.TextSize = 18
floatBtn.Font = Enum.Font.GothamBold
floatBtn.Visible = false
floatBtn.Parent = screenGui
Instance.new("UICorner", floatBtn).CornerRadius = UDim.new(1, 0)
floatBtn.Active = true
floatBtn.Draggable = true

-- ==================== LOADING ====================
local loading = Instance.new("Frame")
loading.Size = UDim2.new(0, 320, 0, 180)
loading.Position = UDim2.new(0.5, -160, 0.5, -90)
loading.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
loading.Parent = screenGui
Instance.new("UICorner", loading).CornerRadius = UDim.new(0, 16)

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1, 0, 0, 50)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "SexyBoy Hub"
loadTitle.TextColor3 = Color3.fromRGB(0, 220, 160)
loadTitle.TextSize = 26
loadTitle.Font = Enum.Font.GothamBold
loadTitle.Parent = loading

local loadBar = Instance.new("Frame")
loadBar.Size = UDim2.new(0.8, 0, 0, 7)
loadBar.Position = UDim2.new(0.1, 0, 0, 120)
loadBar.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
loadBar.Parent = loading
Instance.new("UICorner", loadBar).CornerRadius = UDim.new(1, 0)

local loadFill = Instance.new("Frame")
loadFill.Size = UDim2.new(0, 0, 1, 0)
loadFill.BackgroundColor3 = Color3.fromRGB(0, 220, 160)
loadFill.Parent = loadBar
Instance.new("UICorner", loadFill).CornerRadius = UDim.new(1, 0)

task.spawn(function()
    for i = 1, 100 do
        loadFill.Size = UDim2.new(i/100, 0, 1, 0)
        task.wait(0.012)
    end
    task.wait(0.25)
    loading:Destroy()
    showLogin()
end)

-- ==================== INICIAR SESION ====================
function showLogin()
    local login = Instance.new("Frame")
    login.Size = UDim2.new(0, 310, 0, 260)
    login.Position = UDim2.new(0.5, -155, 0.5, -130)
    login.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
    login.Parent = screenGui
    Instance.new("UICorner", login).CornerRadius = UDim.new(0, 16)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 45)
    title.BackgroundTransparency = 1
    title.Text = "Iniciar Sesión"
    title.TextColor3 = Color3.fromRGB(0, 220, 160)
    title.TextSize = 20
    title.Font = Enum.Font.GothamBold
    title.Parent = login

    local userBox = Instance.new("TextBox")
    userBox.Size = UDim2.new(0.85, 0, 0, 40)
    userBox.Position = UDim2.new(0.075, 0, 0, 60)
    userBox.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    userBox.PlaceholderText = "Usuario"
    userBox.Text = ""
    userBox.TextColor3 = Color3.new(1,1,1)
    userBox.TextSize = 14
    userBox.Parent = login
    Instance.new("UICorner", userBox).CornerRadius = UDim.new(0, 10)

    local passBox = Instance.new("TextBox")
    passBox.Size = UDim2.new(0.85, 0, 0, 40)
    passBox.Position = UDim2.new(0.075, 0, 0, 115)
    passBox.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    passBox.PlaceholderText = "Contraseña"
    passBox.Text = ""
    passBox.TextColor3 = Color3.new(1,1,1)
    passBox.TextSize = 14
    passBox.Parent = login
    Instance.new("UICorner", passBox).CornerRadius = UDim.new(0, 10)

    local enterBtn = Instance.new("TextButton")
    enterBtn.Size = UDim2.new(0.85, 0, 0, 42)
    enterBtn.Position = UDim2.new(0.075, 0, 0, 180)
    enterBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 130)
    enterBtn.Text = "Entrar"
    enterBtn.TextColor3 = Color3.new(1,1,1)
    enterBtn.TextSize = 15
    enterBtn.Font = Enum.Font.GothamBold
    enterBtn.Parent = login
    Instance.new("UICorner", enterBtn).CornerRadius = UDim.new(0, 10)

    enterBtn.MouseButton1Click:Connect(function()
        if userBox.Text == "sexyboy01" and passBox.Text == "messi10" then
            login:Destroy()
            createHub()
        else
            userBox.Text = ""
            passBox.Text = ""
            userBox.PlaceholderText = "Incorrecto"
        end
    end)
end

-- ==================== UI HELPERS ====================
local mainFrame = nil

local function createToggle(parent, name, desc, y, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -16, 0, 58)
    row.Position = UDim2.new(0, 8, 0, y)
    row.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
    row.Parent = parent
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 10)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 0, 28)
    label.Position = UDim2.new(0, 12, 0, 4)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(235, 235, 240)
    label.TextSize = 14
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = row

    local descL = Instance.new("TextLabel")
    descL.Size = UDim2.new(0.65, 0, 0, 20)
    descL.Position = UDim2.new(0, 12, 0, 30)
    descL.BackgroundTransparency = 1
    descL.Text = desc
    descL.TextColor3 = Color3.fromRGB(130, 130, 140)
    descL.TextSize = 11
    descL.Font = Enum.Font.Gotham
    descL.TextXAlignment = Enum.TextXAlignment.Left
    descL.Parent = row

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 50, 0, 26)
    toggle.Position = UDim2.new(1, -60, 0.5, -13)
    toggle.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
    toggle.Text = ""
    toggle.Parent = row
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 20, 0, 20)
    circle.Position = UDim2.new(0, 3, 0.5, -10)
    circle.BackgroundColor3 = Color3.new(1,1,1)
    circle.Parent = toggle
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(toggle, TweenInfo.new(0.15), {
            BackgroundColor3 = state and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(55, 55, 60)
        }):Play()
        TweenService:Create(circle, TweenInfo.new(0.15), {
            Position = state and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
        }):Play()
        callback(state)
    end)
    return row
end

local function createButton(parent, name, desc, y, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -16, 0, 52)
    btn.Position = UDim2.new(0, 8, 0, y)
    btn.BackgroundColor3 = color
    btn.Text = ""
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0, 26)
    label.Position = UDim2.new(0, 10, 0, 4)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.new(1,1,1)
    label.TextSize = 14
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = btn

    local descL = Instance.new("TextLabel")
    descL.Size = UDim2.new(1, -10, 0, 18)
    descL.Position = UDim2.new(0, 10, 0, 28)
    descL.BackgroundTransparency = 1
    descL.Text = desc
    descL.TextColor3 = Color3.fromRGB(200, 200, 210)
    descL.TextSize = 11
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
    main.Size = UDim2.new(0, 350, 0, 520)
    main.Position = UDim2.new(0.5, -175, 0.5, -260)
    main.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
    main.Active = true
    main.Draggable = true
    main.Parent = screenGui
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)
    mainFrame = main

    floatBtn.Visible = false

    local top = Instance.new("Frame")
    top.Size = UDim2.new(1, 0, 0, 48)
    top.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    top.Parent = main
    Instance.new("UICorner", top).CornerRadius = UDim.new(0, 16)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -50, 1, 0)
    title.Position = UDim2.new(0, 14, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = t("title")
    title.TextColor3 = Color3.fromRGB(0, 220, 160)
    title.TextSize = 18
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = top

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -38, 0.5, -15)
    closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.TextSize = 14
    closeBtn.Parent = top
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

    closeBtn.MouseButton1Click:Connect(function()
        main.Visible = false
        floatBtn.Visible = true
    end)

    floatBtn.MouseButton1Click:Connect(function()
        main.Visible = true
        floatBtn.Visible = false
    end)

    -- Tabs
    local tabBar = Instance.new("Frame")
    tabBar.Size = UDim2.new(1, -12, 0, 32)
    tabBar.Position = UDim2.new(0, 6, 0, 54)
    tabBar.BackgroundTransparency = 1
    tabBar.Parent = main

    local pages, tabBtns = {}, {}
    local tabNames = {"combat", "movement", "teleports", "settings"}
    local tabLabels = {t("combat"), t("movement"), t("teleports"), t("settings")}

    for i, key in ipairs(tabNames) do
        local tab = Instance.new("TextButton")
        tab.Size = UDim2.new(0.23, 0, 1, 0)
        tab.Position = UDim2.new((i-1) * 0.25, 0, 0, 0)
        tab.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
        tab.Text = tabLabels[i]
        tab.TextColor3 = Color3.fromRGB(150, 150, 160)
        tab.TextSize = 11
        tab.Font = Enum.Font.GothamSemibold
        tab.Parent = tabBar
        Instance.new("UICorner", tab).CornerRadius = UDim.new(0, 8)

        local page = Instance.new("ScrollingFrame")
        page.Size = UDim2.new(1, 0, 1, -95)
        page.Position = UDim2.new(0, 0, 0, 95)
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 3
        page.CanvasSize = UDim2.new(0, 0, 0, 450)
        page.Visible = false
        page.Parent = main

        pages[key] = page
        tabBtns[key] = tab

        tab.MouseButton1Click:Connect(function()
            for k, p in pairs(pages) do
                p.Visible = (k == key)
                tabBtns[k].BackgroundColor3 = (k == key) and Color3.fromRGB(0, 160, 120) or Color3.fromRGB(28, 28, 34)
                tabBtns[k].TextColor3 = (k == key) and Color3.new(1,1,1) or Color3.fromRGB(150, 150, 160)
            end
        end)
    end

    pages["combat"].Visible = true
    tabBtns["combat"].BackgroundColor3 = Color3.fromRGB(0, 160, 120)
    tabBtns["combat"].TextColor3 = Color3.new(1,1,1)

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
    createToggle(pages["combat"], t("rpg"), t("rpgDesc"), 70, function(on)
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
    createToggle(pages["combat"], t("turret"), t("turretDesc"), 135, function(on)
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

    createButton(pages["combat"], t("refresh"), t("refreshDesc"), 205, Color3.fromRGB(0, 140, 190), function()
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

    createButton(pages["combat"], t("refreshCS"), t("refreshCSDesc"), 265, Color3.fromRGB(0, 170, 130), function()
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
    createToggle(pages["movement"], t("speed"), t("speedDesc"), 5, function(on)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = on and 48 or 16
        end
    end)

    local infJump = false
    createToggle(pages["movement"], t("jump"), t("jumpDesc"), 70, function(on)
        infJump = on
    end)
    UserInputService.JumpRequest:Connect(function()
        if infJump and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    local flyOn, flyBV = false, nil
    createToggle(pages["movement"], t("fly"), t("flyDesc"), 135, function(on)
        flyOn = on
        if on then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                flyBV = Instance.new("BodyVelocity")
                flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                flyBV.Velocity = Vector3.zero
                flyBV.Parent = hrp
                task.spawn(function()
                    while flyOn and flyBV and flyBV.Parent do
                        local cam = workspace.CurrentCamera
                        local dir = Vector3.zero
                        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
                        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
                        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
                        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
                        flyBV.Velocity = dir.Magnitude > 0.1 and dir.Unit * 80 or Vector3.zero
                        task.wait()
                    end
                end)
            end
        else
            if flyBV then flyBV:Destroy() flyBV = nil end
        end
    end)

    -- ===== TELEPORTS =====
    createButton(pages["teleports"], t("harbour"), t("tpDesc"), 5, Color3.fromRGB(0, 140, 100), function()
        Event:FireServer("Teleport", {"Harbour", ""})
    end)
    createButton(pages["teleports"], t("islandA"), t("tpDesc"), 65, Color3.fromRGB(0, 110, 180), function()
        Event:FireServer("Teleport", {"Island", "A", 0})
    end)
    createButton(pages["teleports"], t("islandB"), t("tpDesc"), 125, Color3.fromRGB(0, 110, 180), function()
        Event:FireServer("Teleport", {"Island", "B", 0})
    end)
    createButton(pages["teleports"], t("islandC"), t("tpDesc"), 185, Color3.fromRGB(0, 110, 180), function()
        Event:FireServer("Teleport", {"Island", "C", 0})
    end)
    createButton(pages["teleports"], t("carrier"), t("tpDesc"), 245, Color3.fromRGB(180, 100, 40), function()
        Event:FireServer("Teleport", {"Carrier", "", 0})
    end)
    createButton(pages["teleports"], t("battleship"), t("tpDesc"), 305, Color3.fromRGB(100, 80, 180), function()
        Event:FireServer("Teleport", {"Battleship", "", 0})
    end)

    -- ===== SETTINGS =====
    createButton(pages["settings"], "Español", "Cambiar a español", 5, Color3.fromRGB(50, 120, 200), function()
        lang = "ES"
        main:Destroy()
        createHub()
    end)
    createButton(pages["settings"], "English", "Switch to English", 65, Color3.fromRGB(50, 120, 200), function()
        lang = "EN"
        main:Destroy()
        createHub()
    end)
end

print("¡Gracias por usar mi Hub! Disfruta del script... cualquier sugerencia a mi Discord: srmoises. / moises.01")
print("Thanks for using my Hub! Enjoy the script... send any suggestions to my Discord: srmoises. / moises.01")
