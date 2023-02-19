getgenv().AnimationToChangeTo = "Zombie" -- // All animations you can change to: {"Psycho", "Retro", "Sassy", "Tough", "Zombie"}
if not game:IsLoaded() then game.Loaded:Wait(); end

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");

-- // Variables
local Client = Players.LocalPlayer

local Remotes = ReplicatedStorage:FindFirstChild("Remotes");
local SwapAnim = Remotes:FindFirstChild("SwapAnim");

-- // Main
SwapAnim:FireServer(getgenv().AnimationToChangeTo);

-- // Connections
Client.CharacterAdded:Connect(function(Character)
    Character:WaitForChild("Humanoid");
    SwapAnim:FireServer(getgenv().AnimationToChangeTo);
end);
