-- 🔹 Script Toggle
local Enabled = false

local DiscordLink = "https://discord.gg/yourdiscord" -- Your Discord link for kick

-- 🔹 Obfuscated Script Logic (I Need To Remember This!!)

do
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    -- Kick if script disabled
    if not Enabled then
        LocalPlayer:Kick("This script is disabled!\nJoin Discord: " .. DiscordLink)
        return
    end

    -- ====== Obfuscated/Hidden Script ======
    local code = "local ScreenGui=Instance.new('ScreenGui')ScreenGui.Name='MyScriptGUI'ScreenGui.Parent=game.Players.LocalPlayer:WaitForChild('PlayerGui')local Frame=Instance.new('Frame')Frame.Size=UDim2.new(0,300,0,150)Frame.Position=UDim2.new(0.5,-150,0.5,-75)Frame.BackgroundColor3=Color3.fromRGB(35,35,35)Frame.Parent=ScreenGui;local TextLabel=Instance.new('TextLabel')TextLabel.Text='Script is running!'TextLabel.Size=UDim2.new(1,0,1,0)TextLabel.BackgroundTransparency=1TextLabel.TextColor3=Color3.fromRGB(255,255,255)TextLabel.Parent=Frame;print('✅ Script loaded successfully!')"
    
    -- Execute the obfuscated code
    local func, err = loadstring(code)
    if func then
        func()
    else
        warn("Error loading script: "..err)
    end
end