getgenv().SpamDelay = 1 -- increase this if it kicks u
if not game:IsLoaded() then game.Loaded:Wait(); end

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");

-- // Variables
local Answer = ReplicatedStorage:FindFirstChild("Answer");

local Event = Instance.new("BindableEvent");
RunService:BindToRenderStep("PhoneSpam", 1, function() 
    task.wait(getgenv().SpamDelay or 1)
    Event:Fire();
end);

-- // Main loop
RunService.PostSimulation:Connect(function(deltaTime) 
    for i = 1, #Players:GetPlayers() do 
        task.wait();
    
        local Player = Players:GetPlayers()[i];
        if Player == Players.LocalPlayer then continue end 
    
        Event.Event:Wait();
        Answer:FireServer(Player);
    end
end);
