-- // SexyBoy Hub v3 - Con 2 Refresh

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

local function playSound(id, vol)
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://" .. tostring(id)
    s.Volume = vol or 0.4
    s.Parent = SoundService
    s:Play()
    game:GetService("Debris"):AddItem(s, 3)
end

-- ==================== LOADING ====================
local loading = Instance.new("Frame")
loading.Size = UDim2.new(0, 340, 0, 200)
loading.Position = UDim2.new(0.5, -170, 0.5, -100)
loading.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
loading.Parent = screenGui
Instance.new("UICorner", loading).CornerRadius = UDim.new(0, 18)

local glow = Instance.new("UIStroke")
glow.Color = Color3.fromRGB(0, 220, 160)
glow.Thickness = 1.5
glow.Transparency = 0.4
glow.Parent = loading

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1, 0, 0, 55)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "SexyBoy Hub"
loadTitle.TextColor3 = Color3.fromRGB(0, 220, 160)
loadTitle.TextSize = 28
loadTitle.Font = Enum.Font.GothamBold
loadTitle.Parent = loading

local loadSub = Instance.new("TextLabel")
loadSub.Size = UDim2.new(1, 0, 0, 25)
loadSub.Position = UDim2.new(0, 0, 0, 50)
loadSub.BackgroundTransparency = 1
loadSub.Text = "Naval Warfare Edition"
loadSub.TextColor3 = Color3.fromRGB(120, 120, 130)
loadSub.TextSize = 13
loadSub.Font = Enum.Font.Gotham
loadSub.Parent = loading

local loadStatus = Instance.new("TextLabel")
loadStatus.Size = UDim2.new(1, 0, 0, 20)
loadStatus.Position = UDim2.new(0, 0, 0, 130)
loadStatus.BackgroundTransparency = 1
loadStatus.Text = "Iniciando..."
loadStatus.TextColor3 = Color3.fromRGB(160, 160, 170)
loadStatus.TextSize = 13
loadStatus.Font = Enum.Font.Gotham
loadStatus.Parent = loading

local loadBar = Instance.new("Frame")
loadBar.Size = UDim2.new(0.8, 0, 0, 8)
loadBar.Position = UDim2.new(0.1, 0, 0, 160)
loadBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
loadBar.Parent = loading
Instance.new("UICorner", loadBar).CornerRadius = UDim.new(1, 0)

local loadFill = Instance.new("Frame")
loadFill.Size = UDim2.new(0, 0, 1, 0)
loadFill.BackgroundColor3 = Color3.fromRGB(0, 220, 160)
loadFill.Parent = loadBar
Instance.new("UICorner", loadFill).CornerRadius = UDim.new(1, 0)

task.spawn(function()
    playSound(12222225, 0.3)
    for i = 1, 100 do
        loadFill.Size = UDim2.new(i/100, 0, 1, 0)
        if i == 25 then loadStatus.Text = "Cargando módulos..."
        elseif i == 55 then loadStatus.Text = "Verificando..."
        elseif i == 85 then loadStatus.Text = "Casi listo..."
        end
        task.wait(0.015)
    end
    loadStatus.Text = "Completado ✓"
    task.wait(0.35)
    loading:Destroy()
    showLogin()
end)

-- ==================== LOGIN ====================
function showLogin()
    local login = Instance.new("Frame")
    login.Size = UDim2.new(0, 320, 0, 280)
    login.Position = UDim2.new(0.5, -160, 0.5, -140)
    login.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
    login.Parent = screenGui
    Instance.new("UICorner", login).CornerRadius = UDim.new(0, 18)

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 200, 150)
    stroke.Thickness = 1.2
    stroke.Transparency = 0.5
    stroke.Parent = login

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.Text = "Iniciar Sesión"
    title.TextColor3 = Color3.fromRGB(0, 220, 160)
    title.TextSize = 22
    title.Font = Enum.Font.GothamBold
    title.Parent = login

    local userBox = Instance.new("TextBox")
    userBox.Size = UDim2.new(0.82, 0, 0, 42)
    userBox.Position = UDim2.new(0.09, 0, 0, 70)
    userBox.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    userBox.PlaceholderText = "Usuario"
    userBox.Text = ""
    userBox.TextColor3 = Color3.new(1,1,1)
    userBox.TextSize = 15
    userBox.Font = Enum.Font.Gotham
    userBox.Parent = login
    Instance.new("UICorner", userBox).CornerRadius = UDim.new(0, 10)

    local passBox = Instance.new("TextBox")
    passBox.Size = UDim2.new(0.82, 0, 0, 42)
    passBox.Position = UDim2.new(0.09, 0, 0, 125)
    passBox.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    passBox.PlaceholderText = "Contraseña"
    passBox.Text = ""
    passBox.TextColor3 = Color3.new(1,1,1)
    passBox.TextSize = 15
    passBox.Font = Enum.Font.Gotham
    passBox.Parent = login
    Instance.new("UICorner", passBox).CornerRadius = UDim.new(0, 10)

    local errLabel = Instance.new("TextLabel")
    errLabel.Size = UDim2.new(1, 0, 0, 20)
    errLabel.Position = UDim2.new(0, 0, 0, 175)
    errLabel.BackgroundTransparency = 1
    errLabel.Text = ""
    errLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    errLabel.TextSize = 13
    errLabel.Parent = login

    local enterBtn = Instance.new("TextButton")
    enterBtn.Size = UDim2.new(0.82, 0, 0, 44)
    enterBtn.Position = UDim2.new(0.09, 0, 0, 205)
    enterBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 130)
    enterBtn.Text = "Entrar"
    enterBtn.TextColor3 = Color3.new(1,1,1)
    enterBtn.TextSize = 16
    enterBtn.Font = Enum.Font.GothamBold
    enterBtn.Parent = login
    Instance.new("UICorner", enterBtn).CornerRadius = UDim.new(0, 10)

    enterBtn.MouseButton1Click:Connect(function()
        if userBox.Text == "sexyboy01" and passBox.Text == "messi10" then
            playSound(12222225, 0.4)
            login:Destroy()
            createHub()
        else
            playSound(12222200, 0.3)
            errLabel.Text = "Usuario o contraseña incorrectos"
            userBox.Text = ""
            passBox.Text = ""
        end
    end)
end

-- ==================== TOGGLE / BUTTON ====================
local function createToggle(parent, name, y, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -20, 0, 46)
    row.Position = UDim2.new(0, 10, 0, y)
    row.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
    row.Parent = parent
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 12)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0, 14, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(230, 230, 235)
    label.TextSize = 14
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = row

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 54, 0, 28)
    toggle.Position = UDim2.new(1, -66, 0.5, -14)
    toggle.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
    toggle.Text = ""
    toggle.Parent = row
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)

    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(0, 22, 0, 22)
    circle.Position = UDim2.new(0, 3, 0.5, -11)
    circle.BackgroundColor3 = Color3.new(1,1,1)
    circle.Parent = toggle
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        playSound(12222225, 0.2)
        TweenService:Create(toggle, TweenInfo.new(0.18), {
            BackgroundColor3 = state and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(55, 55, 60)
        }):Play()
        TweenService:Create(circle, TweenInfo.new(0.18), {
            Position = state and UDim2.new(1, -25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11)
        }):Play()
        callback(state)
    end)
end

local function createButton(parent, name, y, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 44)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    btn.MouseButton1Click:Connect(function()
        playSound(12222225, 0.25)
        callback()
    end)
end

-- ==================== MAIN HUB ====================
function createHub()
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 360, 0, 540)
    main.Position = UDim2.new(0.5, -180, 0.5, -270)
    main.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
    main.Active = true
    main.Draggable = true
    main.Parent = screenGui
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 180, 140)
    stroke.Thickness = 1.2
    stroke.Transparency = 0.55
    stroke.Parent = main

    local top = Instance.new("Frame")
    top.Size = UDim2.new(1, 0, 0, 50)
    top.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    top.Parent = main
    Instance.new("UICorner", top).CornerRadius = UDim.new(0, 18)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -95, 1, 0)
    title.Position = UDim2.new(0, 16, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "SexyBoy Hub"
    title.TextColor3 = Color3.fromRGB(0, 220, 160)
    title.TextSize = 19
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = top

    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0, 32, 0, 32)
    minBtn.Position = UDim2.new(1, -74, 0.5, -16)
    minBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    minBtn.Text = "−"
    minBtn.TextColor3 = Color3.new(1,1,1)
    minBtn.TextSize = 20
    minBtn.Font = Enum.Font.GothamBold
    minBtn.Parent = top
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 9)

    local minimized = false
    local fullSize = main.Size
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        main.Size = minimized and UDim2.new(0, 360, 0, 50) or fullSize
    end)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 32, 0, 32)
    closeBtn.Position = UDim2.new(1, -38, 0.5, -16)
    closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.TextSize = 15
    closeBtn.Parent = top
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 9)
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    local tabBar = Instance.new("Frame")
    tabBar.Size = UDim2.new(1, -20, 0, 36)
    tabBar.Position = UDim2.new(0, 10, 0, 58)
    tabBar.BackgroundTransparency = 1
    tabBar.Parent = main

    local pages, tabBtns = {}, {}

    local function makeTab(name, order)
        local tab = Instance.new("TextButton")
        tab.Size = UDim2.new(0.31, 0, 1, 0)
        tab.Position = UDim2.new(order * 0.345, 0, 0, 0)
        tab.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
        tab.Text = name
        tab.TextColor3 = Color3.fromRGB(150, 150, 160)
        tab.TextSize = 13
        tab.Font = Enum.Font.GothamSemibold
        tab.Parent = tabBar
        Instance.new("UICorner", tab).CornerRadius = UDim.new(0, 10)

        local page = Instance.new("Frame")
        page.Size = UDim2.new(1, 0, 1, -105)
        page.Position = UDim2.new(0, 0, 0, 105)
        page.BackgroundTransparency = 1
        page.Visible = false
        page.Parent = main

        pages[name] = page
        tabBtns[name] = tab

        tab.MouseButton1Click:Connect(function()
            for n, p in pairs(pages) do
                p.Visible = (n == name)
                tabBtns[n].BackgroundColor3 = (n == name) and Color3.fromRGB(0, 160, 120) or Color3.fromRGB(28, 28, 34)
                tabBtns[n].TextColor3 = (n == name) and Color3.new(1,1,1) or Color3.fromRGB(150, 150, 160)
            end
        end)
    end

    makeTab("Combat", 0)
    makeTab("Movement", 1)
    makeTab("Teleports", 2)

    pages["Combat"].Visible = true
    tabBtns["Combat"].BackgroundColor3 = Color3.fromRGB(0, 160, 120)
    tabBtns["Combat"].TextColor3 = Color3.new(1,1,1)

    -- ========== COMBAT ==========
    local killAura = false
    createToggle(pages["Combat"], "KillAura Rifle", 8, function(on)
        killAura = on
        if on then
            task.spawn(function()
                while killAura do
                    pcall(function()
                        Event:FireServer("shootRifle", "", {})
                        for _, plr in pairs(game.Players:GetPlayers()) do
                            if plr ~= player and plr.Team ~= player.Team and plr.Character then
                                local t = plr.Character:FindFirstChild("Head") or plr.Character:FindFirstChild("HumanoidRootPart")
                                local h = plr.Character:FindFirstChild("Humanoid")
                                if t and h and h.Health > 0 then
                                    Event:FireServer("shootRifle", "", {t})
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
    createToggle(pages["Combat"], "Auto RPG", 60, function(on)
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
    createToggle(pages["Combat"], "Predictive Turret", 112, function(on)
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
                            local t = dist / 320
                            if dist > 600 then t = t * 1.15 end
                            Event:FireServer("aim", {best.Position + v * t})
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

    -- REFRESH (va al Harbour y vuelve)
    createButton(pages["Combat"], "🛡️  Refresh", 170, Color3.fromRGB(0, 150, 200), function()
        task.spawn(function()
            local char = player.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local humanoid = char:FindFirstChild("Humanoid")
            if not hrp or not humanoid then return end

            local lastCFrame = hrp.CFrame

            local seat = Instance.new("Seat")
            seat.Name = "FFSeat"
            seat.Size = Vector3.new(2, 0.4, 2)
            seat.Transparency = 1
            seat.CanCollide = false
            seat.Anchored = true
            seat.CFrame = hrp.CFrame * CFrame.new(0, -1.5, 0)
            seat.Parent = workspace

            seat:Sit(humanoid)
            task.wait(0.15)

            Event:FireServer("Teleport", {"Harbour", ""})
            task.wait(0.85)

            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = lastCFrame
            end

            task.wait(0.2)
            if seat then seat:Destroy() end
        end)
    end)

    -- REFRESH CLIENT SIDE (sin moverte)
    createButton(pages["Combat"], "🛡️  Refresh Client Side", 222, Color3.fromRGB(0, 180, 140), function()
        task.spawn(function()
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            local humanoid = char:WaitForChild("Humanoid")

            local seat = Instance.new("Seat")
            seat.Name = "LocalSeat"
            seat.Size = Vector3.new(2, 0.5, 2)
            seat.Transparency = 1
            seat.CanCollide = false
            seat.Anchored = false
            seat.CFrame = hrp.CFrame * CFrame.new(0, -2, 0)
            seat.Parent = workspace

            local weld = Instance.new("WeldConstraint")
            weld.Part0 = hrp
            weld.Part1 = seat
            weld.Parent = seat

            task.wait(0.1)
            seat:Sit(humanoid)
            task.wait(0.2)

            Event:FireServer("Teleport", {"Harbour", ""})
            print("Refresh Client Side activado")
        end)
    end)

    -- ========== MOVEMENT ==========
    createToggle(pages["Movement"], "Speed x3", 8, function(on)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = on and 48 or 16
        end
    end)

    local infJump = false
    createToggle(pages["Movement"], "Infinite Jump", 60, function(on)
        infJump = on
    end)
    UserInputService.JumpRequest:Connect(function()
        if infJump and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    local flyOn, flyBV = false, nil
    createToggle(pages["Movement"], "Fly", 112, function(on)
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

    -- ========== TELEPORTS ==========
    createButton(pages["Teleports"], "🏠  Harbour", 8, Color3.fromRGB(0, 140, 100), function()
        Event:FireServer("Teleport", {"Harbour", ""})
    end)
    createButton(pages["Teleports"], "🏝️  Island A", 58, Color3.fromRGB(0, 110, 180), function()
        Event:FireServer("Teleport", {"Island", "A", 0})
    end)
    createButton(pages["Teleports"], "🏝️  Island B", 108, Color3.fromRGB(0, 110, 180), function()
        Event:FireServer("Teleport", {"Island", "B", 0})
    end)
    createButton(pages["Teleports"], "🏝️  Island C", 158, Color3.fromRGB(0, 110, 180), function()
        Event:FireServer("Teleport", {"Island", "C", 0})
    end)
    createButton(pages["Teleports"], "✈️  Carrier", 208, Color3.fromRGB(180, 100, 40), function()
        Event:FireServer("Teleport", {"Carrier", "", 0})
    end)
    createButton(pages["Teleports"], "🚢  Battleship", 258, Color3.fromRGB(100, 80, 180), function()
        Event:FireServer("Teleport", {"Battleship", "", 0})
    end)
end

print("SexyBoy Hub v3 cargando...")
