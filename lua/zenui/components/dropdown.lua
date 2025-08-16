--[[
    ZenUI By ImWuX
    Components/Dropdown
]]--

ZenUI.Utils.CreateFont("ZenUI.Dropdown.Text", 20)

local DROPDOWN = {}

function DROPDOWN:Init()
    self:SetTall(30)
    self:SetFont("ZenUI.Dropdown.Text")
    self:SetPlaceholder("ZenUI Dropdown")
    self:SetTextInset(10, 0)
    self:SetContentAlignment(4)
    self:SetColor(ZenUI.Colors.Secondary)
    self:SetTextColor(ZenUI.Colors.Text)

    self.DropButton = self:Add("DPanel")
	self.DropButton.Paint = function(panel, w, h)
        derma.SkinHook("Paint", "ComboDownArrow", panel, w, h)
    end
	self.DropButton:SetMouseInputEnabled(false)
	self.DropButton.ComboBox = self

    self.Open = false
    self.Values = {}
    self.Value = nil

    hook.Add("VGUIMousePressed", self, function(self, panel, mouseCode)
        if !self.Open or panel == self or !self.Dropdown then return end
        for _, v in pairs(self.Dropdown:GetCanvas():GetChildren()) do
            if v == panel then
                return
            end
        end
        self:SetOpen(false)
    end)
end

function DROPDOWN:OnRemove()
    hook.Remove("VGUIMousePressed", self)
end

function DROPDOWN:PerformLayout(w, h)
    self.DropButton:SetPos(w - h / 1.5, h / 4)
    self.DropButton:SetSize(h / 2, h / 2)
end

function DROPDOWN:Paint(w, h)
    if self.Open then
        draw.RoundedBoxEx(4, 0, 0, w, h, self.Color, true, true)
    else
        draw.RoundedBox(4, 0, 0, w, h, self.Color)
    end
end

function DROPDOWN:DoClick()
    self:SetOpen(!self.Open)
end

function DROPDOWN:SetOpen(value)
    self.Open = value

    if self.Dropdown then
        self.Dropdown:Remove()
    end

    if self.Open then
        self.Dropdown = self:Add("ZenUI.Scroll")
        self.Dropdown:SetPos(self:LocalToScreen(0, 30))
        self.Dropdown:SetSize(self:GetWide(), 30 * #self.Values)
        self.Dropdown:SetDrawOnTop(true)
        self.Dropdown:MakePopup()
        self.Dropdown:SetColor(ZenUI.Colors.Tertiary)

        self.Dropdown.Paint = function(_, w, h)
            if self.Open then
                draw.RoundedBoxEx(4, 0, 0, w, h, self.Color, false, false, true, true)
            else
                draw.RoundedBox(4, 0, 0, w, h, self.Color)
            end
        end

        self.Dropdown.ValueButtons = {}
        for i = 1, #self.Values do
            self.Dropdown.ValueButtons[i] = self.Dropdown:Add("DButton")
            self.Dropdown.ValueButtons[i]:SetSize(self.Dropdown:GetWide(), 30)
            self.Dropdown.ValueButtons[i]:SetPos(0, 30 * (i - 1))
            self.Dropdown.ValueButtons[i]:SetText(self.Values[i].Label and self.Values[i].Label or self.Placeholder)
            self.Dropdown.ValueButtons[i]:SetTextColor(self:GetTextColor())
            self.Dropdown.ValueButtons[i]:SetFont(self:GetFont())
            self.Dropdown.ValueButtons[i].ActivePosition = 0
            local isLast = i == #self.Values
            self.Dropdown.ValueButtons[i].Paint = function(self, w, h)
                if self:IsHovered() then
                    self.ActivePosition = Lerp(0.05, self.ActivePosition, self:GetWide())
                    draw.RoundedBoxEx(4, (self:GetWide() - self.ActivePosition) / 2, 0, self.ActivePosition, h, Color(255, 255, 255, 10), false, false, isLast, isLast)
                else
                    self.ActivePosition = 0
                end
            end
            self.Dropdown.ValueButtons[i].DoClick = function()
                self.Value = self.Values[i].Value
                self:SetText(self.Values[i].Label and self.Values[i].Label or self.Placeholder)
                self:SetOpen(false)
                if self.OnValueChange and isfunction(self.OnValueChange) then
                    self:OnValueChange(self.Value)
                end
            end
        end

        if self.Dropdown:GetTall() > 500 then
            self.Dropdown:SetTall(500)
        end
    end
end

function DROPDOWN:IsMenuOpen()
    return self.Open
end

function DROPDOWN:SetValue(value, noValueChanged)
    noValueChanged = noValueChanged or false
    if self.OnValueChange and isfunction(self.OnValueChange) then
        if !noValueChanged and self.Value != value then
            self:OnValueChange(value)
        end
    end

    if value == nil then
        self.Value = nil
        self:SetText(self.Placeholder)
        return
    end

    local found = false
    local label = ""
    for _, v in pairs(self.Values) do
        if v.Value == value then
            found = true
            label = v.Label
            break
        end
    end

    if found then
        self.Value = value
        self:SetText(label)
    else
        error("Tried setting dropdown to an invalid value")
    end
end

function DROPDOWN:GetValue()
    return self.Value
end

function DROPDOWN:AddValue(value, label)
    if value == nil then
        label = nil
    else
        if !label then
            label = tostring(value)
        end
    end
    local labelCounter = 1
    local orgLabel = label
    for _, v in pairs(self.Values) do
        if v.Label == label then
            label = string.format("%s (%s)", orgLabel, labelCounter)
            labelCounter = labelCounter + 1
        end
        if v.Value == value then
            error("Cannot add two identical values, try using different labels")
            return
        end
    end
    self.Values[#self.Values + 1] = { Value = value, Label = label }
end

function DROPDOWN:SetPlaceholder(value)
    self.Placeholder = value
    self:SetText(self.Placeholder)
end

function DROPDOWN:GetPlaceholder()
    return self.Placeholder
end

function DROPDOWN:SetColor(color)
    self.Color = color
end

function DROPDOWN:GetColor()
    return self.Color
end

function DROPDOWN:SetFontSize(size)
    self.Font = "ZenUI.Dropdown.Text" .. size
    ZenUI.Utils.CreateFont(self.Font, size)
    self:SetFont(self.Font)
end

vgui.Register("ZenUI.Dropdown", DROPDOWN, "DButton")