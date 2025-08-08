--[[
    ZenUI By ImWuX
    Components/Panel
]]--

local PANEL = {}

function PANEL:Init()
    self:SetColor(ZenUI.Colors.Primary)
end

function PANEL:Paint(w, h)
    BSHADOWS.BeginShadow()
        local x, y = self:GetPos() -- Shadow Fucks With Pos
        draw.RoundedBox(8, x, y, w, h, self.Color)
    BSHADOWS.EndShadow(1, 2, 2, 255, 0, 0, true)

    draw.RoundedBox(4, 0, 0, w, h, self.Color)
end

function PANEL:SetColor(color)
    self.Color = color
end

function PANEL:GetColor()
    return color
end

vgui.Register("ZenUI.Panel", PANEL, "EditablePanel")