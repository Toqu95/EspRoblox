local Camera = game:GetService("Workspace").CurrentCamera
local Center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)

local Framework = {}

function Framework.LineAdd(Part, Color)
    local DrawingLines = Drawing.new("Line")
    DrawingLines.Thickness = 1
    DrawingLines.Color = Color
    DrawingLines.From = Center
    DrawingLines.To = Vector2.new(0, 0)
    DrawingLines.Visible = true

    local function Update()
        local C
        C = game:GetService("RunService").RenderStepped:Connect(function()
            local Vector, Onscreen = Camera:WorldToScreenPoint(Part.Position)

            if Part then
                if Onscreen then
                    DrawingLines.To = Vector2.new(Vector.X, Vector.Y)
                    DrawingLines.Visible = true
                    DrawingLines.From = Center
                    if Color == Color3.fromRGB(0, 0, 0)
                        then DrawingLines.Color = Color3.fromRGB(255, 255, 255)
                    else
                        DrawingLines.Color = Color
                    end
                else
                    DrawingLines.Visible = false
                    DrawingLines.To = Vector2.new(0,0)
                    DrawingLines.From = Vector2.new(0,0)
                end
            else
                DrawingLines.Visible = false
                C:Disconnect()
            end
        end)
    end
    coroutine.wrap(Update)()
end

function Framework.TextAdd(Part, Text, Color)
    local DrawingText = Drawing.new("Text")
    DrawingText.Text = Text
    DrawingText.Size = 20
    DrawingText.Center = true
    DrawingText.Outline = true
    DrawingText.Color = Color
    DrawingText.Font = 1
    DrawingText.Visible = true

    local function Update()
        local C
        C = game:GetService("RunService").RenderStepped:Connect(function()
            local Vector, Onscreen = Camera:WorldToScreenPoint(Part.Position)

            if Part then
                if Onscreen then
                    DrawingText.Visible = true
                    DrawingText.Position = Vector2.new(Vector.X, Vector.Y)
                    if Color == Color3.fromRGB(0, 0, 0)
                        then DrawingText.Color = Color3.fromRGB(255, 255, 255)
                    else
                        DrawingText.Color = Color
                    end
                    DrawingText.Color = Color
                else
                    DrawingText.Visible = false
                end
            else
                DrawingText.Visible = false
                C:Disconnect()
            end
        end)
    end
    coroutine.wrap(Update)()
end
