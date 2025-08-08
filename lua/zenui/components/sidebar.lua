--[[
    ZenUI By ImWuX
    Components/Sidebar
]]--

ZenUI.Utils.CreateFont("ZenUI.Sidebar.ButtonTitle", 25)
ZenUI.Utils.CreateFont("ZenUI.Sidebar.ButtonDescription", 18)

local SIDEBAR = {}

function SIDEBAR:Init()
    self:SetWide(180)
    self:SetColor(ZenUI.Colors.Secondary)
    self:SetAccentColor(ZenUI.Colors.Accent)
    self:SetTitleColor(ZenUI.Colors.Text)
    self:SetDescriptionColor(ZenUI.Colors.SecondaryText)
    self.Buttons = {}
    self.SelectedButton = 1
    self.Animate = true
end

function SIDEBAR:Paint(w, h)
    self.ActivePosition = Lerp(0.04, self.ActivePosition or 0, (self.SelectedButton - 1) * 55)            
    draw.RoundedBoxEx(4, 0, 0, w, h, self.Color, false, false, true, false)
    surface.SetDrawColor(255, 255, 255, 10)
    surface.DrawRect(0, self.ActivePosition, w, 55)
    surface.SetDrawColor(self.AccentColor)
    surface.DrawRect(w-2, self.ActivePosition, w, 55)
end

function SIDEBAR:SetTarget(target)
    self.Target = target
    self.Target.Animating = false
    self.Target.PerformLayout = function(self, w, h)
        if self.Animating then return end
        for _, v in pairs(self:GetChildren()) do
            v:StretchToParent(0, 0, 0, 0)
        end
    end
end

function SIDEBAR:SetAnimate(state)
    self.Animate = state
end

function SIDEBAR:AddButton(title, description, element)
    local i = #self.Buttons + 1
    self.Buttons[i] = self:Add("Panel")
    self.Buttons[i]:SetCursor("hand")
    self.Buttons[i]:Dock(TOP)
    self.Buttons[i]:SetTall(55)
    self.Buttons[i].Title = title
    self.Buttons[i].Element = element
    self.Buttons[i].OnMouseReleased = function(_, mcode)
        if mcode != MOUSE_LEFT then return end
        self:SetSelectedButton(i)
    end
    self.Buttons[i].Paint = function(_, w, h)
        surface.SetFont("ZenUI.Sidebar.ButtonTitle")
        local titleW, titleH = surface.GetTextSize(title)

        surface.SetFont("ZenUI.Sidebar.ButtonDescription")
        local descW, descH = surface.GetTextSize(description)        

        surface.SetFont("ZenUI.Sidebar.ButtonTitle")
        surface.SetTextColor(self.TitleColor)
        surface.SetTextPos(10, h/2 - titleH/2 - descH/2)
        surface.DrawText(title)

        surface.SetFont("ZenUI.Sidebar.ButtonDescription")
        surface.SetTextColor(self.DescriptionColor)
        surface.SetTextPos(10, h/2 - descH/2 + titleH/2)
        surface.DrawText(description)
    end

    if i == self.SelectedButton then
        self.Target:Clear()
        self.Target.SelectedButtonTitle = self.Buttons[self.SelectedButton].Title
        local e = self.Target:Add(self.Buttons[self.SelectedButton].Element)
        e:StretchToParent(0, 0, 0, 0)
    end
end

function SIDEBAR:SetSelectedButton(button)
    if #self.Buttons < button then return end

    self.SelectedButton = button
    if self.Target then
        self.Target:Clear()
        self.Target.SelectedButtonTitle = self.Buttons[button].Title
        local e = self.Target:Add(self.Buttons[button].Element)
        e:StretchToParent(0, 0, 0, 0)
        if self.Animate then
            self.Target.Animating = true
            e:SetPos(self.Target:GetParent():GetWide())
            e:MoveTo(0, 0, 0.3, 0, -3, function()
                self.Target.Animating = false
            end)
        end
    end
end

function SIDEBAR:SetColor(color)
    self.Color = color
end

function SIDEBAR:GetColor()
    return self.Color
end

function SIDEBAR:SetAccentColor(color)
    self.AccentColor = color
end

function SIDEBAR:GetAccentColor()
    return self.AccentColor
end

function SIDEBAR:SetTitleColor(color)
    self.TitleColor = color
end

function SIDEBAR:GetTitleColor()
    return self.TitleColor
end

function SIDEBAR:SetDescriptionColor(color)
    self.DescriptionColor = color
end

function SIDEBAR:GetDescriptionColor()
    return self.DescriptionColor
end

vgui.Register("ZenUI.Sidebar", SIDEBAR)