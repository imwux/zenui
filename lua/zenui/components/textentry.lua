--[[
    ZenUI By ImWuX
    Components/TextEntry
]]--

ZenUI.Utils.CreateFont("ZenUI.TextEntry.Text", 20)

local TEXTENTRY = {}

function TEXTENTRY:Init()
    self:SetTall(30)

    self.Entry = self:Add("DTextEntry")
    self.Entry:Dock(FILL)
    self.Entry:DockMargin(4, 3, 3, 3)
    self.Entry:SetDrawBorder(false)
    self.Entry:SetDrawBackground(false)
    self.Entry:SetFont("ZenUI.TextEntry.Text")
    self.Entry:SetPlaceholderText("ZenUI Input")
    self.Entry:SetMultiline(false)
    self.Entry.OnValueChange = function(entryself, value)
        if self.OnValueChange then
            self:OnValueChange(value)
        end
    end
    self.Entry.OnLoseFocus = function(entryself)
        if self.OnValueChange then
            self:OnValueChange(entryself:GetValue())
        end
    end

    self:SetColor(ZenUI.Colors.Secondary)
    self:SetTextColor(ZenUI.Colors.Text)
    self:SetPlaceholderColor(ZenUI.Colors.SecondaryText)
    self:SetAccentColor(ZenUI.Colors.Accent)
end

function TEXTENTRY:Paint(w, h)
    self.ActivePosition = Lerp(0.05, self.ActivePosition or 0, self.Entry:IsEditing() and w or 0)

    draw.RoundedBox(4, 0, 0, w, h, self:GetColor())
    draw.RoundedBox(5, w / 2 - self.ActivePosition / 2, 0, self.ActivePosition, h, self.AccentColor)
    draw.RoundedBox(4, 1, 1, w - 2, h - 2, self:GetColor())
end

function TEXTENTRY:SetValue(value)
    self.Entry:SetValue(value)
end

function TEXTENTRY:GetValue()
    return self.Entry:GetValue()
end

function TEXTENTRY:SetPlaceholderText(text)
    self.Entry:SetPlaceholderText(text)
end

function TEXTENTRY:GetPlaceholderText()
    return self.Entry:GetPlaceholderText()
end

function TEXTENTRY:SetAccentColor(color)
    self.AccentColor = color
    self.Entry:SetHighlightColor(color)
end

function TEXTENTRY:GetAccentColor()
    return self.AccentColor
end

function TEXTENTRY:SetColor(color)
    self.Color = color
end

function TEXTENTRY:GetColor()
    return self.Color
end

function TEXTENTRY:SetTextColor(color)
    self.Entry:SetTextColor(color)
    self.Entry:SetCursorColor(color)
end

function TEXTENTRY:GetTextColor()
    self.Entry:GetTextColor()
end

function TEXTENTRY:SetPlaceholderColor(color)
    self.Entry:SetPlaceholderColor(color)
end

function TEXTENTRY:GetPlaceholderColor()
    return self.Entry:GetPlaceholderColor()
end

function TEXTENTRY:SetFontSize(size)
    self.Font = "ZenUI.TextEntry.Text" .. size
    ZenUI.Utils.CreateFont(self.Font, size)
    self.Entry:SetFont(self.Font)
end

vgui.Register("ZenUI.TextEntry", TEXTENTRY)