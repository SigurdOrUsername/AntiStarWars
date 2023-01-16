local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local function GetEnemies()
    local Enemies = {}

    for Index, Enemy in next, Players:GetPlayers() do
        if Enemy ~= Player and Enemy.Character and not Enemy.Character:FindFirstChildWhichIsA("ForceField") and Enemy.Character:FindFirstChild("Humanoid") then
            table.insert(Enemies, Enemy)
        end
    end

    return Enemies
end

while task.wait() do
    local Tool = Player.Character:FindFirstChildWhichIsA("Tool")
    
    if Tool then
        local Enemies = GetEnemies()

        if #Enemies > 0 then
            for Index, Enemy in next, Enemies do
                while Enemy.Character and Enemy.Character:FindFirstChild("Humanoid") and Enemy.Character.Humanoid.Health > 0 do
                    Player.Character.HumanoidRootPart.CFrame = Enemy.Character.HumanoidRootPart.CFrame * CFrame.new(0, -10, 0)
                    Tool.Core.Comm:FireServer({
                        1,
                        Enemy.Character.Humanoid,
                        10,
                        14.8,
                        Vector3.new()
                    })
                    task.wait()
                end
            end
        else
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 5000000, 0)
        end
    end
end
