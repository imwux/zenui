--[[
    ZenUI By ImWuX
    Components/Button
]]--

ZenUI.Utils.CreateFont("ZenUI.Button.Text", 20)

local BUTTON = {}

function BUTTON:Init()
    self:SetText("ZenUI Button")
    self:SetColor(ZenUI.Colors.Secondary)
    self:SetAccentColor(ZenUI.Colors.Accent)
    self:SetTextColor(ZenUI.Colors.Text)
    self:SetFont("ZenUI.Button.Text")
    self:SetTall(30)
end

function BUTTON:Paint(w, h)
    self.ActiveAlpha = Lerp(0.05, self.ActiveAlpha or 0, self:IsHovered() and 255 or 0)
    draw.RoundedBox(4, 0, 0, w, h, self.Color)
    draw.RoundedBox(4, 0, 0, w, h, Color(self.AccentColor.r, self.AccentColor.g, self.AccentColor.b, self.ActiveAlpha))
    draw.RoundedBox(4, 1, 1, w - 2, h - 2, self.Color)
end

function BUTTON:SetColor(color)
    self.Color = color
end

function BUTTON:GetColor()
    return self.Color
end

function BUTTON:SetAccentColor(color)
    self.AccentColor = color
end

function BUTTON:GetAccentColor()
    return self.AccentColor
end

function BUTTON:SetFontSize(size)
    self.Font = "ZenUI.Button.Text" .. size
    ZenUI.Utils.CreateFont(self.Font, size)
    self:SetFont(self.Font)
end

vgui.Register("ZenUI.Button", BUTTON, "DButton")