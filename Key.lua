--[[
    ================================================================
    [ SCRIPT INFORMATION ]
    Project: Custom Script (Redesigned UI)
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

local Config = {
    -- [1] PlatoBoost Settings
    ServiceId       = 28736,
    PlatoSecret     = "264d690e-d391-4ff3-bf1e-bb2c42126f5c",

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = "49032246",
    
    -- [3] Scripts & Links
    MainScriptURL   = "https://raw.githubusercontent.com/moisess011/sexyboyhub/refs/heads/main/script.lua",
    
    -- [4] Social Media Settings
    ShowDiscord     = false,
    DiscordURL      = "https://discord.gg/kT55J724BK",
    
    ShowInstagram   = false,
    InstagramURL    = "https://www.instagram.com/oyb0i/",
    
    ShowYoutube     = false,
    YoutubeURL      = "https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ",

    -- [5] File System
    KeyFileName     = "Mykey.txt",

    -- [6] GUI Management
    OldGuiName      = "setsoboy",
    MainGuiName     = "setsoboy",

    -- [7] Hub Information & UI Text
    HubName         = "SEXYBOY HUB",
    HubDescription  = "Enter your personal key to authenticate access"
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local useNonce = true

local function safeRequest(options)
    local req = request or http_request or syn_request or (http and http.request)
    if not req then return nil, "HTTP requests not supported" end
    local success, response = pcall(function() return req(options) end)
    if success and response then return response else return nil, "Connection Error" end
end

local fSetClipboard = setclipboard or toclipboard or function() end
local fStringChar, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local fGetHwid = gethwid or function() return game:GetService("RbxAnalyticsService"):GetClientId() end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"

local function checkConnectivity()
    local response = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
    if not response or (response.StatusCode ~= 200 and response.StatusCode ~= 429) then
        host = "https://api.platoboost.net"
    end
end
checkConnectivity()

local function generateNonce()
    local str = ""
    for _ = 1, 16 do str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return str
end

local function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response, err = safeRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({service = Config.ServiceId, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response and response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, cachedLink
end

local function redeemKey(key)
    local nonce = generateNonce()
    local body = {identifier = lDigest(fGetHwid()), key = key}
    if useNonce then body.nonce = nonce end
    
    local response, err = safeRequest({
        Url = host .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = lEncode(body),
        Headers = {["Content-Type"] = "application/json"}
    })
    
    if response and response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then 
                    if writefile then writefile(Config.KeyFileName, key) end
                    return true, "Success" 
                end
                return false, "Integrity Check Failed"
            end
            if writefile then writefile(Config.KeyFileName, key) end
            return true, "Success"
        end
        return false, decoded.message or "Invalid Key"
    end
    return false, err or "Server Error"
end

-------------------------------------------------------------------------------
--! PROFESSIONAL PRESTIGE UI ENGINE
-------------------------------------------------------------------------------

local TweenService = game:GetService("TweenService")

local function StartMainScript()
    local player = game:GetService("Players").LocalPlayer
    local pGui = player:WaitForChild("PlayerGui")
    
    if pGui:FindFirstChild(Config.OldGuiName) then 
        pGui[Config.OldGuiName]:Destroy() 
        task.wait(0.1)
    end
    
    _G[Config.Secret] = true 
    loadstring(game:HttpGet(Config.MainScriptURL))()
end

local function CreateGUI()
    local player = game:GetService("Players").LocalPlayer
    local coreGui = game:GetService("CoreGui")
    local targetParent = pcall(function() return coreGui end) and coreGui or player:WaitForChild("PlayerGui")
    
    if targetParent:FindFirstChild("OYB_KeySystem") then targetParent.OYB_KeySystem:Destroy() end

    local ScreenGui = Instance.new("ScreenGui", targetParent)
    ScreenGui.Name = "OYB_KeySystem"
    ScreenGui.ResetOnSpawn = false

    -- Theme Palette
    local Colors = {
        Bg = Color3.fromRGB(10, 10, 12),
        Card = Color3.fromRGB(18, 18, 23),
        Input = Color3.fromRGB(13, 13, 17),
        Accent = Color3.fromRGB(0, 170, 255),
        AccentHover = Color3.fromRGB(30, 185, 255),
        TextPrimary = Color3.fromRGB(245, 245, 248),
        TextSecondary = Color3.fromRGB(135, 135, 150),
        TextMuted = Color3.fromRGB(80, 80, 95),
        Success = Color3.fromRGB(0, 230, 130),
        Error = Color3.fromRGB(255, 75, 75),
        Stroke = Color3.fromRGB(35, 35, 45)
    }

    ---------------------------------------------------------------------------
    -- [1] PREMIUM CINEMATIC LOADING SCREEN
    ---------------------------------------------------------------------------
    local SplashFrame = Instance.new("Frame", ScreenGui)
    SplashFrame.Size = UDim2.new(0, 360, 0, 180)
    SplashFrame.Position = UDim2.new(0.5, -180, 0.5, -90)
    SplashFrame.BackgroundColor3 = Colors.Bg
    SplashFrame.BorderSizePixel = 0
    SplashFrame.ClipsDescendants = true
    
    local SplashCorner = Instance.new("UICorner", SplashFrame)
    SplashCorner.CornerRadius = UDim.new(0, 16)
    
    local SplashStroke = Instance.new("UIStroke", SplashFrame)
    SplashStroke.Color = Colors.Stroke
    SplashStroke.Thickness = 1

    -- Subtle Background Glow
    local GlowEffect = Instance.new("ImageLabel", SplashFrame)
    GlowEffect.Size = UDim2.new(1, 100, 1, 100)
    GlowEffect.Position = UDim2.new(0.5, -230, 0.5, -140)
    GlowEffect.BackgroundTransparency = 1
    GlowEffect.Image = "rbxassetid://5028857472"
    GlowEffect.ImageColor3 = Colors.Accent
    GlowEffect.ImageTransparency = 0.92

    -- Brand Title
    local SplashTitle = Instance.new("TextLabel", SplashFrame)
    SplashTitle.Size = UDim2.new(1, 0, 0, 32)
    SplashTitle.Position = UDim2.new(0, 0, 0.22, 0)
    SplashTitle.BackgroundTransparency = 1
    SplashTitle.Text = Config.HubName
    SplashTitle.TextColor3 = Colors.TextPrimary
    SplashTitle.Font = Enum.Font.GothamBold
    SplashTitle.TextSize = 20
    SplashTitle.TextTransparency = 1

    -- Sub Status
    local SplashStatus = Instance.new("TextLabel", SplashFrame)
    SplashStatus.Size = UDim2.new(1, 0, 0, 20)
    SplashStatus.Position = UDim2.new(0, 0, 0.44, 0)
    SplashStatus.BackgroundTransparency = 1
    SplashStatus.Text = "INITIALIZING SYSTEM"
    SplashStatus.TextColor3 = Colors.Accent
    SplashStatus.Font = Enum.Font.GothamMedium
    SplashStatus.TextSize = 10
    SplashStatus.TextTransparency = 1

    -- Progress Bar Track
    local Track = Instance.new("Frame", SplashFrame)
    Track.Size = UDim2.new(0.75, 0, 0, 4)
    Track.Position = UDim2.new(0.125, 0, 0.68, 0)
    Track.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    Track.BorderSizePixel = 0
    Track.BackgroundTransparency = 1
    Instance.new("UICorner", Track).CornerRadius = UDim.new(1, 0)

    -- Progress Bar Fill
    local Fill = Instance.new("Frame", Track)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Colors.Accent
    Fill.BorderSizePixel = 0
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)

    local FillGradient = Instance.new("UIGradient", Fill)
    FillGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Colors.Accent),
        ColorSequenceKeypoint.new(1, Colors.AccentHover)
    })

    -- Percentage Counter
    local PercentLabel = Instance.new("TextLabel", SplashFrame)
    PercentLabel.Size = UDim2.new(1, 0, 0, 18)
    PercentLabel.Position = UDim2.new(0, 0, 0.77, 0)
    PercentLabel.BackgroundTransparency = 1
    PercentLabel.Text = "0%"
    PercentLabel.TextColor3 = Colors.TextMuted
    PercentLabel.Font = Enum.Font.GothamSemibold
    PercentLabel.TextSize = 10
    PercentLabel.TextTransparency = 1

    -- Sequence Animations
    TweenService:Create(SplashTitle, TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
    task.wait(0.2)
    TweenService:Create(SplashStatus, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
    TweenService:Create(Track, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
    TweenService:Create(PercentLabel, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

    -- Animated Load Simulation
    local duration = 1.8
    local startTime = tick()
    while tick() - startTime < duration do
        local alpha = (tick() - startTime) / duration
        local smoothed = TweenService:GetValue(alpha, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        Fill.Size = UDim2.new(smoothed, 0, 1, 0)
        PercentLabel.Text = math.floor(smoothed * 100) .. "%"
        task.wait()
    end
    Fill.Size = UDim2.new(1, 0, 1, 0)
    PercentLabel.Text = "100%"
    
    task.wait(0.2)

    -- Fade Out Splash
    TweenService:Create(SplashTitle, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TweenService:Create(SplashStatus, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TweenService:Create(Track, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Fill, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(PercentLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    
    local SplashExit = TweenService:Create(SplashFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 360, 0, 0),
        Position = UDim2.new(0.5, -180, 0.5, 0)
    })
    SplashExit:Play()
    SplashExit.Completed:Wait()
    SplashFrame:Destroy()

    ---------------------------------------------------------------------------
    -- [2] MODERN EXECUTIVE KEY SYSTEM UI
    ---------------------------------------------------------------------------
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 340, 0, 270)
    MainFrame.Position = UDim2.new(0.5, -170, 0.5, -135)
    MainFrame.BackgroundColor3 = Colors.Bg
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.ClipsDescendants = true
    MainFrame.BackgroundTransparency = 1
    
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)
    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Color = Colors.Stroke
    MainStroke.Thickness = 1
    MainStroke.Transparency = 1

    -- Header Bar
    local Header = Instance.new("Frame", MainFrame)
    Header.Size = UDim2.new(1, 0, 0, 48)
    Header.BackgroundTransparency = 1

    local TitleLabel = Instance.new("TextLabel", Header)
    TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    TitleLabel.Position = UDim2.new(0, 18, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = Config.HubName
    TitleLabel.TextColor3 = Colors.TextPrimary
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 13
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton", Header)
    CloseBtn.Size = UDim2.new(0, 28, 0, 28)
    CloseBtn.Position = UDim2.new(1, -38, 0, 10)
    CloseBtn.BackgroundColor3 = Colors.Card
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Colors.TextSecondary
    CloseBtn.Font = Enum.Font.GothamMedium
    CloseBtn.TextSize = 11
    CloseBtn.AutoButtonColor = false
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)
    local CloseStroke = Instance.new("UIStroke", CloseBtn)
    CloseStroke.Color = Colors.Stroke
    CloseStroke.Thickness = 1

    -- Close Button Hover Effect
    CloseBtn.MouseEnter:Connect(function()
        TweenService:Create(CloseBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 20, 25), TextColor3 = Colors.Error}):Play()
    end)
    CloseBtn.MouseLeave:Connect(function()
        TweenService:Create(CloseBtn, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Card, TextColor3 = Colors.TextSecondary}):Play()
    end)
    CloseBtn.MouseButton1Click:Connect(function()
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, 340, 0, 0), Position = UDim2.new(0.5, -170, 0.5, 0)}):Play()
        task.wait(0.3)
        ScreenGui:Destroy()
    end)

    -- Divider Line
    local Separator = Instance.new("Frame", MainFrame)
    Separator.Size = UDim2.new(1, -36, 0, 1)
    Separator.Position = UDim2.new(0, 18, 0, 48)
    Separator.BackgroundColor3 = Colors.Stroke
    Separator.BorderSizePixel = 0

    -- Welcome Area
    local SubHeader = Instance.new("TextLabel", MainFrame)
    SubHeader.Size = UDim2.new(1, -36, 0, 20)
    SubHeader.Position = UDim2.new(0, 18, 0, 62)
    SubHeader.BackgroundTransparency = 1
    SubHeader.Text = "Authentication Required"
    SubHeader.TextColor3 = Colors.TextPrimary
    SubHeader.Font = Enum.Font.GothamBold
    SubHeader.TextSize = 14
    SubHeader.TextXAlignment = Enum.TextXAlignment.Left

    local DescLabel = Instance.new("TextLabel", MainFrame)
    DescLabel.Size = UDim2.new(1, -36, 0, 18)
    DescLabel.Position = UDim2.new(0, 18, 0, 82)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = Config.HubDescription
    DescLabel.TextColor3 = Colors.TextMuted
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.TextSize = 11
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Key Input Container
    local InputFrame = Instance.new("Frame", MainFrame)
    InputFrame.Size = UDim2.new(1, -36, 0, 42)
    InputFrame.Position = UDim2.new(0, 18, 0, 112)
    InputFrame.BackgroundColor3 = Colors.Input
    InputFrame.BorderSizePixel = 0
    Instance.new("UICorner", InputFrame).CornerRadius = UDim.new(0, 8)
    
    local InputStroke = Instance.new("UIStroke", InputFrame)
    InputStroke.Color = Colors.Stroke
    InputStroke.Thickness = 1

    local IconLabel = Instance.new("TextLabel", InputFrame)
    IconLabel.Size = UDim2.new(0, 30, 1, 0)
    IconLabel.Position = UDim2.new(0, 8, 0, 0)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = "🔑"
    IconLabel.TextSize = 13

    local KeyInput = Instance.new("TextBox", InputFrame)
    KeyInput.Size = UDim2.new(1, -45, 1, 0)
    KeyInput.Position = UDim2.new(0, 38, 0, 0)
    KeyInput.BackgroundTransparency = 1
    KeyInput.PlaceholderText = "Paste access key here..."
    KeyInput.Text = ""
    KeyInput.TextColor3 = Colors.TextPrimary
    KeyInput.PlaceholderColor3 = Colors.TextMuted
    KeyInput.Font = Enum.Font.GothamMedium
    KeyInput.TextSize = 12
    KeyInput.TextXAlignment = Enum.TextXAlignment.Left
    KeyInput.ClearTextOnFocus = false

    KeyInput.Focused:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.2), {Color = Colors.Accent}):Play()
    end)
    KeyInput.FocusLost:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.2), {Color = Colors.Stroke}):Play()
    end)

    -- Action Buttons Area
    local VerifyBtn = Instance.new("TextButton", MainFrame)
    VerifyBtn.Size = UDim2.new(0.48, -4, 0, 38)
    VerifyBtn.Position = UDim2.new(0, 18, 0, 166)
    VerifyBtn.BackgroundColor3 = Colors.Accent
    VerifyBtn.Text = "VERIFY"
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.TextSize = 11
    VerifyBtn.AutoButtonColor = false
    Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 8)

    local GetKeyBtn = Instance.new("TextButton", MainFrame)
    GetKeyBtn.Size = UDim2.new(0.48, -4, 0, 38)
    GetKeyBtn.Position = UDim2.new(0.52, 0, 0, 166)
    GetKeyBtn.BackgroundColor3 = Colors.Card
    GetKeyBtn.Text = "GET KEY"
    GetKeyBtn.TextColor3 = Colors.TextPrimary
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.TextSize = 11
    GetKeyBtn.AutoButtonColor = false
    Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 8)
    
    local GetKeyStroke = Instance.new("UIStroke", GetKeyBtn)
    GetKeyStroke.Color = Colors.Stroke
    GetKeyStroke.Thickness = 1

    -- Button Hover Micro-interactions
    VerifyBtn.MouseEnter:Connect(function()
        TweenService:Create(VerifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Colors.AccentHover}):Play()
    end)
    VerifyBtn.MouseLeave:Connect(function()
        TweenService:Create(VerifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Accent}):Play()
    end)

    GetKeyBtn.MouseEnter:Connect(function()
        TweenService:Create(GetKeyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 25, 32)}):Play()
    end)
    GetKeyBtn.MouseLeave:Connect(function()
        TweenService:Create(GetKeyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Card}):Play()
    end)

    -- Status Sub-Footer
    local StatusContainer = Instance.new("Frame", MainFrame)
    StatusContainer.Size = UDim2.new(1, -36, 0, 24)
    StatusContainer.Position = UDim2.new(0, 18, 0, 218)
    StatusContainer.BackgroundTransparency = 1

    local StatusDot = Instance.new("Frame", StatusContainer)
    StatusDot.Size = UDim2.new(0, 6, 0, 6)
    StatusDot.Position = UDim2.new(0, 0, 0.5, -3)
    StatusDot.BackgroundColor3 = Colors.TextMuted
    StatusDot.BorderSizePixel = 0
    Instance.new("UICorner", StatusDot).CornerRadius = UDim.new(1, 0)

    local Status = Instance.new("TextLabel", StatusContainer)
    Status.Size = UDim2.new(1, -14, 1, 0)
    Status.Position = UDim2.new(0, 12, 0, 0)
    Status.BackgroundTransparency = 1
    Status.Text = "Awaiting credentials..."
    Status.TextColor3 = Colors.TextMuted
    Status.Font = Enum.Font.GothamMedium
    Status.TextSize = 10
    Status.TextXAlignment = Enum.TextXAlignment.Left

    -- Smooth Opening Animation
    TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
    TweenService:Create(MainStroke, TweenInfo.new(0.4), {Transparency = 0}):Play()

    ---------------------------------------------------------------------------
    -- [3] ELEGANT FLOATING TOAST NOTIFICATION SYSTEM
    ---------------------------------------------------------------------------
    local function ShowToast(title, desc)
        local OldToast = ScreenGui:FindFirstChild("ToastNotification")
        if OldToast then OldToast:Destroy() end

        local Toast = Instance.new("Frame", ScreenGui)
        Toast.Name = "ToastNotification"
        Toast.Size = UDim2.new(0, 260, 0, 58)
        Toast.Position = UDim2.new(1, 20, 0, 24)
        Toast.BackgroundColor3 = Colors.Card
        Toast.BorderSizePixel = 0
        Toast.ClipsDescendants = true
        Instance.new("UICorner", Toast).CornerRadius = UDim.new(0, 10)
        
        local ToastStroke = Instance.new("UIStroke", Toast)
        ToastStroke.Color = Colors.Stroke
        ToastStroke.Thickness = 1

        local Badge = Instance.new("Frame", Toast)
        Badge.Size = UDim2.new(0, 28, 0, 28)
        Badge.Position = UDim2.new(0, 12, 0.5, -14)
        Badge.BackgroundColor3 = Color3.fromRGB(0, 40, 25)
        Badge.BorderSizePixel = 0
        Instance.new("UICorner", Badge).CornerRadius = UDim.new(0, 8)

        local CheckIcon = Instance.new("TextLabel", Badge)
        CheckIcon.Size = UDim2.new(1, 0, 1, 0)
        CheckIcon.BackgroundTransparency = 1
        CheckIcon.Text = "✓"
        CheckIcon.TextColor3 = Colors.Success
        CheckIcon.Font = Enum.Font.GothamBold
        CheckIcon.TextSize = 12

        local TTitle = Instance.new("TextLabel", Toast)
        TTitle.Size = UDim2.new(1, -50, 0, 18)
        TTitle.Position = UDim2.new(0, 48, 0, 10)
        TTitle.BackgroundTransparency = 1
        TTitle.Text = title
        TTitle.TextColor3 = Colors.TextPrimary
        TTitle.Font = Enum.Font.GothamBold
        TTitle.TextSize = 11
        TTitle.TextXAlignment = Enum.TextXAlignment.Left

        local TDesc = Instance.new("TextLabel", Toast)
        TDesc.Size = UDim2.new(1, -50, 0, 16)
        TDesc.Position = UDim2.new(0, 48, 0, 28)
        TDesc.BackgroundTransparency = 1
        TDesc.Text = desc
        TDesc.TextColor3 = Colors.TextMuted
        TDesc.Font = Enum.Font.Gotham
        TDesc.TextSize = 10
        TDesc.TextXAlignment = Enum.TextXAlignment.Left

        -- Auto Dismiss Bar
        local ProgressBar = Instance.new("Frame", Toast)
        ProgressBar.Size = UDim2.new(1, 0, 0, 2)
        ProgressBar.Position = UDim2.new(0, 0, 1, -2)
        ProgressBar.BackgroundColor3 = Colors.Success
        ProgressBar.BorderSizePixel = 0

        -- Entrance Animation
        TweenService:Create(Toast, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, -280, 0, 24)
        }):Play()

        TweenService:Create(ProgressBar, TweenInfo.new(3.5, Enum.EasingStyle.Linear), {
            Size = UDim2.new(0, 0, 0, 2)
        }):Play()

        task.delay(3.5, function()
            if Toast and Toast.Parent then
                local Exit = TweenService:Create(Toast, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    Position = UDim2.new(1, 20, 0, 24)
                })
                Exit:Play()
                Exit.Completed:Wait()
                Toast:Destroy()
            end
        end)
    end

    ---------------------------------------------------------------------------
    -- EVENT BINDINGS
    ---------------------------------------------------------------------------
    VerifyBtn.MouseButton1Click:Connect(function()
        local key = KeyInput.Text
        if key == "" then 
            Status.Text = "Please input a key"
            Status.TextColor3 = Colors.Error
            StatusDot.BackgroundColor3 = Colors.Error
            return 
        end

        Status.Text = "Authenticating..."
        Status.TextColor3 = Colors.Accent
        StatusDot.BackgroundColor3 = Colors.Accent

        local success, msg = redeemKey(key)
        if success then
            Status.Text = "Key verified! Loading..."
            Status.TextColor3 = Colors.Success
            StatusDot.BackgroundColor3 = Colors.Success
            task.wait(0.6)
            
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 340, 0, 0),
                Position = UDim2.new(0.5, -170, 0.5, 0)
            }):Play()
            task.wait(0.3)
            
            ScreenGui:Destroy()
            StartMainScript()
        else
            Status.Text = msg or "Invalid key provided"
            Status.TextColor3 = Colors.Error
            StatusDot.BackgroundColor3 = Colors.Error
        end
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        Status.Text = "Generating link..."
        Status.TextColor3 = Colors.TextSecondary
        StatusDot.BackgroundColor3 = Colors.TextSecondary

        local success, link = cacheLink()
        if success then
            fSetClipboard(link)
            Status.Text = "Link copied to clipboard"
            Status.TextColor3 = Colors.Accent
            StatusDot.BackgroundColor3 = Colors.Accent
            
            ShowToast("Link Copied", "Access link saved to clipboard.")
        else
            Status.Text = "Failed to connect to server"
            Status.TextColor3 = Colors.Error
            StatusDot.BackgroundColor3 = Colors.Error
        end
    end)
end

-- Check if main script GUI is already open
local player = game:GetService("Players").LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

if pGui:FindFirstChild(Config.MainGuiName) then
    StartMainScript()
    return
end

-- Fast Auto Check Saved Key BEFORE opening the GUI
if isfile and isfile(Config.KeyFileName) then
    local savedKey = readfile(Config.KeyFileName)
    if savedKey ~= "" then
        local success = redeemKey(savedKey)
        if success then
            StartMainScript()
            return
        end
    end
end

-- Initialize Professional Key System GUI
CreateGUI()
