--[[
    ZenUI By ImWuX
    Components/Window
]]--

ZenUI.Utils.CreateFont("ZenUI.Window.Title", 25)

local WINDOW = {}

function WINDOW:Init()
    self:SetTitle("ZenUI Window")
    self:SetColor(ZenUI.Colors.Primary)
    self:SetTextColor(ZenUI.Colors.Text)
    self:DockPadding(10, 40, 10, 10)

    self.Dragging = false
    self.DraggingFrom = { x = 0, y = 0 }

    self.CloseButton = self:Add("DButton")
    self.CloseButton:SetText("")
    self.CloseButton:SetSize(16, 16)
    self.CloseButton.Paint = function(self, w, h)
        local color = Color(220, 54, 54)
        if self:IsHovered() then
            color = Color(233, 24, 24)
        end
        draw.RoundedBox(20, 0, 0, w, h, color)
    end
    self.CloseButton.DoClick = function()
        if self.OnExit ~= nil then
            self.OnExit(self)
        end
        self:Remove()
    end
end

function WINDOW:PerformLayout(w, h)
    self.CloseButton:SetPos(w - 23, 7)
end

function WINDOW:Paint(w, h)
    BSHADOWS.BeginShadow()
        local x, y = self:GetPos() -- Shadow Fucks With Pos
        draw.RoundedBox(4, x, y, w, h, self.Color)
    BSHADOWS.EndShadow(1, 2, 2, 255, 0, 0, true)

    draw.RoundedBoxEx(4, 0, 0, w, 30, ZenUI.Utils.Differ(self.Color, 6), true, true)
    draw.RoundedBoxEx(4, 0, 30, w, h - 30, self.Color, false, false, true, true)
    surface.SetFont("ZenUI.Window.Title")
    surface.SetTextColor(self.TextColor)
    local _, textHeight = surface.GetTextSize(self.Title)
    surface.SetTextPos(10, 15 - textHeight / 2)
    surface.DrawText(self.Title)
end

function WINDOW:OnMousePressed(mcode)
    local x, y = self:CursorPos()
    if y < 30 then
        self.Dragging = true
        self.DraggingFrom = { x = x, y = y }
    end
end

function WINDOW:OnMouseReleased(mcode)
    self.Dragging = false
end

function WINDOW:Think()
    if !self.Dragging then return end

    local x = math.Clamp(gui.MouseX(), 1, ScrW() - 1)
    local y = math.Clamp(gui.MouseY(), 1, ScrH() - 1)
    self:SetPos(x - self.DraggingFrom.x, y - self.DraggingFrom.y)
end

function WINDOW:SetTitle(title)
    self.Title = title
end

function WINDOW:GetTitle()
    return self.Title
end

function WINDOW:SetColor(color)
    self.Color = color
end

function WINDOW:GetColor()
    return self.Color
end

function WINDOW:SetTextColor(color)
    self.TextColor = color
end

function WINDOW:GetTextColor()
    return self.TextColor
end

vgui.Register("ZenUI.Window", WINDOW, "EditablePanel")