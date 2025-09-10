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
    local code = "loadstring("\112\114\105\110\116\40\34\32\89\79\85\82\32\83\67\82\73\80\84\32\72\69\82\69\33\33\32\34\41\10")()"
    
    -- Execute the obfuscated code
    local func, err = loadstring(code)
    if func then
        func()
    else
        warn("Error loading script: "..err)
    end
end