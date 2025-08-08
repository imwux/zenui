--[[
    ZenUI By ImWuX
    Components/ColorPicker
]]--

local COLORPICKER = {}

function COLORPICKER:Init()
    self.SaturationImage = self:Add("DImage")
	self.SaturationImage:SetImage("vgui/gradient-r")

	self.ValueImage = self:Add("DImage")
	self.ValueImage:SetImage("vgui/gradient-d")
	self.ValueImage:SetImageColor(color_black)
end

function COLORPICKER:PerformLayout(w, h)
    self.ValueImage:SetSize(w, h)
    self.ValueImage:SetZPos(-8)
    self.SaturationImage:SetSize(w, h)
    self.SaturationImage:SetZPos(-9)
end

function COLORPICKER:Paint(w, h)
	draw.RoundedBox(4, 0, 0, w, h, Color(255, 0, 0))
end

vgui.Register("ZenUI.ColorPicker", COLORPICKER)