--[[
    ZenUI By ImWuX
    Components/Title
]]--

ZenUI.Utils.CreateFont("ZenUI.TitleGroup.TitleText", 30)
ZenUI.Utils.CreateFont("ZenUI.TitleGroup.SubTitleText", 18)

local TITLEGROUP = {}

function TITLEGROUP:Init()
    self.TitleFont = "ZenUI.TitleGroup.TitleText"
    self.SubTitleFont = "ZenUI.TitleGroup.SubTitleText"
    self:SetTitleText("ZenUI TitleGroup")
    self:SetTitleTextColor(ZenUI.Colors.Text)
    self:SetSubTitleTextColor(ZenUI.Colors.SecondaryText)
end

function TITLEGROUP:Paint(w, h)
    surface.SetFont(self.TitleFont)
    surface.SetTextColor(self.TitleColor)
    surface.SetTextPos(0, 0)
    surface.DrawText(self.TitleText)

    local _, height = surface.GetTextSize(self.TitleText)
    if self.SubTitleText then
        surface.SetFont(self.SubTitleFont)
        surface.SetTextColor(self.SubTitleColor)
        surface.SetTextPos(0, height)
        surface.DrawText(self.SubTitleText)
    end
end

function TITLEGROUP:UpdateTall()
    surface.SetFont(self.TitleFont)
    local _, titleTall = surface.GetTextSize(self.TitleText)
    if self.SubTitleText then
        surface.SetFont(self.SubTitleFont)
        local _, subTitleTall = surface.GetTextSize(self.SubTitleText)
        self:SetTall(titleTall + subTitleTall)
    else
        self:SetTall(titleTall)
    end
end

function TITLEGROUP:SetTitleText(text)
    self.TitleText = text
    self:UpdateTall()
end

function TITLEGROUP:GetTitleText()
    return self.TitleText
end

function TITLEGROUP:SetSubTitleText(text)
    self.SubTitleText = text
    self:UpdateTall()
end

function TITLEGROUP:GetSubTitleText()
    return self.SubTitleText
end

function TITLEGROUP:SetTitleTextColor(color)
    self.TitleColor = color
end

function TITLEGROUP:GetTitleTextColor()
    return self.TitleColor
end

function TITLEGROUP:SetSubTitleTextColor(color)
    self.SubTitleColor = color
end

function TITLEGROUP:GetSubTitleTextColor()
    return self.SubTitleColor
end

function TITLEGROUP:SetTitleFontSize(size)
    self.TitleFont = "ZenUI.TitleGroup.TitleText" .. size
    ZenUI.Utils.CreateFont(self.TitleFont, size)
    self:UpdateTall()
end

function TITLEGROUP:SetSubTitleFontSize(size)
    self.SubTitleFont = "ZenUI.TitleGroup.SubTitleText" .. size
    ZenUI.Utils.CreateFont(self.SubTitleFont, size)
    self:UpdateTall()
end

vgui.Register("ZenUI.TitleGroup", TITLEGROUP)