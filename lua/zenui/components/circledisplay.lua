--[[
    ZenUI By ImWuX
    Components/CircleDisplay
]]--

ZenUI.Utils.CreateFont("ZenUI.CircleDisplay.Text", 20)

local CIRCLEDISPLAY = {}

function CIRCLEDISPLAY:Init()
    self:SetWide(200)
    self:SetTall(200)
    self:SetColor(ZenUI.Colors.Accent)
    self:SetTitle("ZenUI CircleDisplay")
    self.Progress = 0
    self.MaxProgress = 0
end

function CIRCLEDISPLAY:Paint(w, h)
    local progress = self.Progress
    local maxProgress = self.MaxProgress

    ZenUI.Utils.DrawCircle(w/2, h/2, w/2, ZenUI.Colors.Secondary)
    ZenUI.Utils.DrawArc(w/2, h/2, 0, progress / maxProgress * 360, w/2, self.Color)
    ZenUI.Utils.DrawCircle(w/2, h/2, w/3, ZenUI.Colors.Primary)
    
    local progressText = string.format("%s / %s", progress, maxProgress)
    surface.SetTextColor(ZenUI.Colors.Text)
    surface.SetFont("ZenUI.Label.Text")
    local tw, th = surface.GetTextSize(self.Title)
    local ptw, pth = surface.GetTextSize(progressText)
    surface.SetTextPos((w - tw) / 2, (h - th - pth - 2) / 2)
    surface.DrawText(self.Title)
    surface.SetTextPos((w - ptw) / 2, (h - th + pth + 2) / 2)
    surface.DrawText(progressText)
end

function CIRCLEDISPLAY:SetTitle(title)
    self.Title = title
end

function CIRCLEDISPLAY:GetTitle()
    return self.Title
end

function CIRCLEDISPLAY:SetColor(color)
    self.Color = color
end

function CIRCLEDISPLAY:GetColor()
    return self.Color
end

function CIRCLEDISPLAY:SetProgress(progress)
    if isfunction(progress) then
        self.ProgressFunc = progress
        self.Progress = progress()
        local timerStr = "ZenUI_Timer_" .. ZenUI.Utils.GetTimerId()
        timer.Create(timerStr, 1, 0, function()
            if !self.ProgressFunc then
                timer.Remove(timerStr)
                return
            end
            self.Progress = self.ProgressFunc()
        end)
    else
        self.Progress = progress
    end
end

function CIRCLEDISPLAY:SetMaxProgress(progress)
    if isfunction(progress) then
        self.MaxProgressFunc = progress
        self.MaxProgress = progress()
        local timerStr = "ZenUI_Timer_" .. ZenUI.Utils.GetTimerId()
        timer.Create(timerStr, 1, 0, function()
            if !self.MaxProgressFunc then
                timer.Remove(timerStr)
                return
            end
            self.MaxProgress = self.MaxProgressFunc()
        end)
    else
        self.MaxProgress = progress
    end
end

vgui.Register("ZenUI.CircleDisplay", CIRCLEDISPLAY)