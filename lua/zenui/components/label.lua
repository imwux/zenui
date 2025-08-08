--[[
    ZenUI By ImWuX
    Components/Label
]]--

ZenUI.Utils.CreateFont("ZenUI.Label.Text", 20)

local LABEL = {}

function LABEL:Init()
    self.Font = "ZenUI.Label.Text"
    self.CenteredX = false
    self.CenteredY = false
    self:SetText("ZenUI Label")
    self:SetTextColor(ZenUI.Colors.Text)
end

function LABEL:Paint(w, h)
    surface.SetFont(self.Font)
    surface.SetTextColor(self.Color)
    local tw, th = surface.GetTextSize(self.Text)
    surface.SetTextPos(self.CenteredX and math.max(0, (w - tw) / 2) or 0, self.CenteredY and math.max(0, (h - th) / 2) or 0)
    surface.DrawText(self.Text)
end

function LABEL:PerformLayout(w, h)
    surface.SetFont(self.Font)
    self.Text = ZenUI.Utils.ShortenText(self.Text, w)
end

function LABEL:SetText(text)
    self.Text = text
    self:InvalidateLayout()
end

function LABEL:GetText()
    return self.Text
end

function LABEL:SetTextColor(color)
    self.Color = color
end

function LABEL:GetTextColor()
    return self.Color
end

function LABEL:SetCenteredX(state)
    self.CenteredX = state
end

function LABEL:GetCenteredX()
    return self.CenteredX
end

function LABEL:SetCenteredY(state)
    self.CenteredY = state
end

function LABEL:GetCenteredY()
    return self.CenteredY
end

function LABEL:SetFontSize(size)
    self.Font = "ZenUI.Label.Text" .. size
    ZenUI.Utils.CreateFont(self.Font, size)
    self:InvalidateLayout()
end

vgui.Register("ZenUI.Label", LABEL)