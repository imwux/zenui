--[[
    ZenUI By ImWuX
    Components/Panel
]]--

local PANEL = {}

function PANEL:Init()
    self.Shadow = true
    self:SetColor(ZenUI.Colors.Primary)
end

function PANEL:Paint(w, h)
    if self.Shadow then
        local x, y = self:LocalToScreen(0, 0) -- Shadow Fucks With Pos
        BSHADOWS.BeginShadow()
            draw.RoundedBox(4, x, y, w, h, self.Color)
        BSHADOWS.EndShadow(1, 2, 2, 255, 0, 0, true)
    end

    draw.RoundedBox(4, 0, 0, w, h, self.Color)
end

function PANEL:SetColor(color)
    self.Color = color
end

function PANEL:GetColor()
    return color
end

function PANEL:SetShadow(enabled)
    self.Shadow = enabled
end

vgui.Register("ZenUI.Panel", PANEL, "EditablePanel")