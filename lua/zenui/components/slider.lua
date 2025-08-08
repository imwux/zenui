--[[
    ZenUI By ImWuX
    Components/Slider
]]--

local SLIDER = {}

function SLIDER:Init()
    self:SetTall(30)
    self:SetColor(ZenUI.Colors.Secondary)
    self:SetKnobColor(ZenUI.Colors.Accent)
    self:SetMinMax(0, 10)
    self.Dragging = false

    self.Value = 5
    self.Round = 2
end

function SLIDER:PerformLayout(w, h)
    self:ReCalculateCircle()
end

function SLIDER:ReCalculateCircle()
    local frac = math.Round(self.Value - self.MinValue, self.Round) / self.MaxValue
    self.CircleData = ZenUI.Utils.CalculateCircle(frac * (self:GetWide() - 12), self:GetTall() / 2 - 6, 12, 12)
end

function SLIDER:Paint(w, h)
    draw.RoundedBox(100, 6, h / 2 - 3, w - 12, 6, self.Color)
    surface.SetDrawColor(self.KnobColor)
    draw.NoTexture()
    surface.DrawPoly(self.CircleData)
end

function SLIDER:OnCursorMoved(x, y)
    if self.Dragging then
        self:SetValue((x / self:GetWide() * (self.MaxValue - self.MinValue)) + self.MinValue)
    end
end

function SLIDER:OnMousePressed(mcode)
    self.Dragging = true
    local x = self:ScreenToLocal(gui.MouseX(), 0)
    self:SetValue((x / self:GetWide() * (self.MaxValue - self.MinValue)) + self.MinValue)
end

function SLIDER:OnMouseReleased(mcode)
    self.Dragging = false
end

function SLIDER:OnCursorExited()
    self.Dragging = false
end

function SLIDER:SetValue(value)
    self.Value = value
    if self.OnValueChange and isfunction(self.OnValueChange) then
        self:OnValueChange(value)
    end
    self:ReCalculateCircle()
end

function SLIDER:GetValue()
    return self.Value
end

function SLIDER:SetColor(color)
    self.Color = color
end

function SLIDER:GetColor()
    return self.Color
end

function SLIDER:SetKnobColor(color)
    self.KnobColor = color
end

function SLIDER:GetKnobColor()
    return self.KnobColor
end

function SLIDER:SetMinMax(min, max)
    self.MinValue = min
    self.MaxValue = max
end

function SLIDER:GetMinMax()
    return self.MinValue, self.MaxValue
end

function SLIDER:SetRound(decimals)
    self.Round = decimals
end

function SLIDER:GetRound()
    return self.Round
end

vgui.Register("ZenUI.Slider", SLIDER)