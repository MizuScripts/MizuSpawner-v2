--// Part 1: Loading Screen
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Create Blur
local blur = Instance.new("BlurEffect")
blur.Size = 20
blur.Parent = game:GetService("Lighting")

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.5, 0, 0.15, 0)
mainFrame.Position = UDim2.new(0.25, 0, 0.4, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- UIStroke (Red Gradient Outline)
local stroke = Instance.new("UIStroke")
stroke.Thickness = 3
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = mainFrame

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150,0,0))
}
gradient.Rotation = 0
gradient.Parent = stroke

-- Title
local title = Instance.new("TextLabel")
title.Text = "X Hub"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Size = UDim2.new(1,0,0.4,0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextStrokeTransparency = 0 -- Outline
title.TextStrokeColor3 = Color3.fromRGB(255,0,0) -- "X" will be colored
title.Parent = mainFrame

-- Progress Bar Back
local barBack = Instance.new("Frame")
barBack.Size = UDim2.new(0.9,0,0.2,0)
barBack.Position = UDim2.new(0.05,0,0.7,0)
barBack.BackgroundColor3 = Color3.fromRGB(50,50,50)
barBack.BorderSizePixel = 0
barBack.Parent = mainFrame

-- Progress Fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(255,0,0)
barFill.BorderSizePixel = 0
barFill.Parent = barBack

-- Tween Progress Bar over 15 seconds
TweenService:Create(barFill, TweenInfo.new(155, Enum.EasingStyle.Linear), {Size = UDim2.new(1,0,1,0)}):Play()

-- After 15s -> Remove Loading + Load Rayfield GUI
task.delay(155, function()
    blur:Destroy()
    screenGui:Destroy()

    -- Load Part 2 (Rayfield GUI)
    --// Part 2: X Hub Main Rayfield GUI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "X Hub",
   LoadingTitle = "X Hub",
   LoadingSubtitle = "by @Dzacbn283",
   Theme = "Green",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XHubConfig"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- Spawner Tab
local SpawnerTab = Window:CreateTab("Spawner", "paw-print")

SpawnerTab:CreateParagraph({
	Title = "Pet Spawner :",
	Content = [[
	]]
})


local PetName = ""

local PetKG = 1
local PetAge = 1

SpawnerTab:CreateInput({
    Name = "Pet Name",
    PlaceholderText = "e.g. Golden Goose",
    Callback = function(text)
        PetName = text
    end
})

SpawnerTab:CreateInput({
    Name = "KG",
    PlaceholderText = "1",
    Callback = function(value)
        PetKG = tonumber(value)
    end
})

SpawnerTab:CreateInput({
    Name = "Age",
    PlaceholderText = "1",
    Callback = function(value)
        PetAge = tonumber(value)
    end
})

SpawnerTab:CreateButton({
    Name = "Spawn Pet",
    Callback = function()
Rayfield:Notify({
            Title = "Successfully Spawned!",
            Content = "Pet : Spawned!\n" .. PetName .. " | KG : " .. PetKG .. " | Age : " .. PetAge,
            Image = "paw-print",
            Duration = 5
})

        Spawner.SpawnPet(PetName, PetKG, PetAge)
    end
})

SpawnerTab:CreateParagraph({
	Title = "Seed Spawner :",
	Content = [[
	]]
})


local SeedName = ""
local seedCount = 0

SpawnerTab:CreateInput({
    Name = "Seed Name",
    PlaceholderText = "e.g. Candy Blossom",
    Callback = function(text)
        SeedName = text
    end
})

SpawnerTab:CreateButton({
    Name = "Spawn Seed",
    Callback = function()
seedCount = seedCount + 1
Rayfield:Notify({
            Title = "Successfully Spawned!",
            Content = "Seed : Spawned!\n" .. SeedName .. " x" .. seedCount,
            Image = "sprout",
            Duration = 5
})

        Spawner.SpawnSeed(SeedName)
    end
})

SpawnerTab:CreateButton({
    Name = "Spin",
    Callback = function()
Rayfield:Notify({
            Title = "Successfully Spin!",
            Content = "Spin : " .. SeedName,
            Image = "sprout",
            Duration = 5
})

        Spawner.Spin(SeedName)
    end
})

SpawnerTab:CreateParagraph({
	Title = "Egg Spawner :",
	Content = [[
	]]
})

local EggName = ""
local eggCount = 0

SpawnerTab:CreateInput({
    Name = "Egg Name",
    PlaceholderText = "e.g. Night Egg",
    Callback = function(text)
        EggName = text
    end
})

SpawnerTab:CreateButton({
    Name = "Spawn Egg",
    Callback = function()
eggCount = eggCount + 1
Rayfield:Notify({
            Title = "Successfully Spawned!",
            Content = "Egg : Spawned!\n" .. EggName .. " x" .. eggCount,
            Image = "egg",
            Duration = 5
})

        Spawner.SpawnEgg(EggName)
    end
})

-- Weather Client Tab
local WeatherTab = Window:CreateTab("Weather Client", "cloud")

-- List of all weathers
local WeatherList = {
    "Obby","Gale","Frost","SheckleRain","MeteorShower","DiscoEvent","ChocolateRain","JandelStorm","DJJhai","Tornado",
    "JandelLazer","BeeNado","BeeStorm","Blackhole","Rainbow","JandelFloat","Windy","SunGod","Volcano","MeteorStrike",
    "Heatwave","AlienInvasion","SpaceTravel","UnderTheSea","Thunderstorm","SolarFlare","Drought","TropicalRain",
    "ChickenRain","AuroraBorealis","Sandstorm","ShootingStars","DJSandstorm","Rain","PoolParty","AirHead",
    "TextCollect","CrystalBeams","JandelZombie","RadioactiveCarrot","AcidRain","Armageddon","SolarEclipse",
    "TK_RouteRunner","TK_PostDunk","TK_MoneyRain","TK_LightningStorm","JandelKatana","Stoplight","JunkbotRaid",
    "Oil","Boil","Cooking","FlamingoLazer","FlamingoFloat","Enchantment","BloodMoonEvent","RainEvent",
    "SpaceTravelEvent","SummerHarvest","AllowFakePurchases"
}

-- Table of selected weathers
local SelectedWeathers = {}

-- Dropdown (MULTI select)
WeatherTab:CreateDropdown({
    Name = "Select Weather(s)",
    Options = WeatherList,
    CurrentOption = {},
    MultipleOptions = true,
    Callback = function(Values)
        SelectedWeathers = Values
    end
})

-- Apply Selected Weathers
WeatherTab:CreateButton({
    Name = "Apply Selected Weather",
    Callback = function()
        if #SelectedWeathers > 0 then
            for _, weather in ipairs(SelectedWeathers) do
                -- ensure attribute exists, then activate
                if Workspace:GetAttribute(weather) == nil then
                    Workspace:SetAttribute(weather, true)
                end
                Workspace:SetAttribute(weather, true)
            end
            Rayfield:Notify({
                Title = "Weather Applied!",
                Content = "Activated: " .. table.concat(SelectedWeathers, ", "),
                Image = "cloud-moon",
                Duration = 5
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "No weathers selected.",
                Image = "cloud-rain",
                Duration = 5
            })
        end
    end
})

-- Reset Weather Changes
WeatherTab:CreateButton({
    Name = "Reset Weather Changes",
    Callback = function()
        for _, weather in ipairs(WeatherList) do
            if Workspace:GetAttribute(weather) ~= nil then
                Workspace:SetAttribute(weather, false)
            end
        end
        Rayfield:Notify({
            Title = "Weather Reset",
            Content = "All weather attributes have been reset (set to false).",
            Image = "cloud-rain",
            Duration = 5
        })
    end
})
end)