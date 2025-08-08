--[[
    ZenUI By ImWuX
    Components/Switch
]]--

ZenUI.MaterialBlock = ZenUI.MaterialBlock or Material("materials/zenui/block.png")

local SWITCH = {}

function SWITCH:Init()
    self:SetSize(40, 20)
    self:SetOnColor(ZenUI.Colors.Accent)
    self:SetOffColor(ZenUI.Colors.Secondary)
    self:SetLocked(false)
    self.Value = false    

    self.Switch = self:Add("DButton")
    self.Switch:SetText("")
    self.Switch:SetSize(40, 20)
    self.Switch.Paint = function(_, w, h)
        local rad = h / 2
        draw.RoundedBox(h, rad / 2, rad / 2, w - rad, h - rad, self.Value and self.OnColor or self.OffColor)
        self.ActivePosition = Lerp(0.04, self.ActivePosition or rad, self.Value and w - rad or rad)
        ZenUI.Utils.DrawCircle(self.ActivePosition, h / 2, rad, ZenUI.Utils.Differ(self.Value and self.OnColor or self.OffColor, 18))

        if self.Locked then
            surface.SetDrawColor(!self.Value and self.OnColor or self.OffColor)
            surface.SetMaterial(ZenUI.MaterialBlock)
            surface.DrawTexturedRect(self.ActivePosition - 5, rad - 6, 12, 12)
        end
    end
    self.Switch.DoClick = function()
        if self.Locked then return end
        self.Value = !self.Value
        if self.OnValueChange then
            self:OnValueChange(self.Value)
        end
    end
end

function SWITCH:PerformLayout(w, h)
    self.Switch:SetPos(0, math.max((h - 20) / 2, 0))
end

function SWITCH:SetLocked(value)
    self.Locked = value
end

function SWITCH:GetLocked()
    return self.Locked
end

function SWITCH:SetValue(value)
    self.Value = value
end

function SWITCH:GetValue()
    return self.Value
end

function SWITCH:SetOnColor(color)
    self.OnColor = color
end

function SWITCH:GetOnColor()
    return self.OnColor
end

function SWITCH:SetOffColor(color)
    self.OffColor = color
end

function SWITCH:GetOffColor()
    return self.OffColor
end

vgui.Register("ZenUI.Switch", SWITCH, "Panel")