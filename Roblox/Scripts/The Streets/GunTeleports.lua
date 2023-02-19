getgenv().Keys = {
    BuyUzi = "M",
    BuyGlock = "N"
};

if not game:IsLoaded() then game.Loaded:Wait(); end 

-- // Services
local ProximityPromptService = game:GetService("ProximityPromptService");
local UserInputService = game:GetService("UserInputService");
local RunService = game:GetService("RunService");
local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");

-- // Variables
local Client = Players.LocalPlayer
local Character = Client.Character or Client.CharacterAdded:Wait();
local Humanoid = Character:WaitForChild("Humanoid");
local RootPart = Humanoid.RootPart or Character.PrimaryPart

local IsTeleporting = false

-- // Functions
local function BuyItem(Key, ItemName)
    if IsTeleporting or not Character or not Humanoid or Humanoid.Health == 0 or not RootPart or Character:FindFirstChild("Bone", true) then return end 

    local SplitName = string.split(ItemName, " |")[1];
    local Item = Workspace:FindFirstChild(ItemName, true);
    local ItemProximityPrompt = Item and Item:FindFirstChild("ProximityPrompt", true);

    if not ItemProximityPrompt then return  end 
    IsTeleporting = true 
    
    while Item.Name ~= "Bought!" and UserInputService:IsKeyDown(Key) do 
        RunService.PreRender:Wait();

        RootPart:PivotTo(Item:GetPivot());
        fireproximityprompt(ItemProximityPrompt);
    end

    IsTeleporting = false
end

-- // Connections
Client.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
    Humanoid = Character:WaitForChild("Humanoid");
    RootPart = Humanoid.RootPart
end);

UserInputService.InputBegan:Connect(function(Key)
    if UserInputService:GetFocusedTextBox() then return end 

    if Key.KeyCode == Enum.KeyCode[getgenv().Keys.BuyUzi] then 
        BuyItem(Enum.KeyCode[getgenv().Keys.BuyUzi], "Uzi | $150");
    elseif Key.KeyCode == Enum.KeyCode[getgenv().Keys.BuyGlock] then 
        BuyItem(Enum.KeyCode[getgenv().Keys.BuyGlock], "Glock | $200");
    end
end);
