--[[
    ZenUI By ImWuX
    Components/Avatar

    Credits For Avatar Painting Go To PatrickRatzow
    https://github.com/PatrickRatzow/EnhancedAvatarImage
]]--

local AVATAR = {}

function AVATAR:Init()
    self.Rotation = 0
    self.Vertices = 50
    self.Avatar = vgui.Create("AvatarImage", self)
    self.Avatar:SetPaintedManually(true)
end

function AVATAR:SetVertices(vertices)
    self.Vertices = vertices
end

function AVATAR:GetVertices()
    return self.Vertices
end

function AVATAR:SetRotation(rotation)
    self.Rotation = rotation
end

function AVATAR:GetRotation()
    return self.Rotation
end

function AVATAR:SetSteamID64(steamid, size)
    self.Avatar:SetSteamID(steamid, size)
end

function AVATAR:SetPlayer(ply, size)
    self.Avatar:SetPlayer(ply, size)
end

function AVATAR:PerformLayout(w, h)
    local sz = w
    if w > h then sz = h end
    self.Avatar:SetSize(sz, sz)
    self:CalculatePoly(sz, sz)
end

function AVATAR:CalculatePoly(w, h)
    local poly = {}

    local x = w/2
    local y = h/2
    local radius = h/2

    table.insert(poly, { x = x, y = y })

    for i = 0, self.Vertices do
        local a = math.rad((i / self.Vertices) * -360) + self.Rotation
        table.insert(poly, { x = x + math.sin(a) * radius, y = y + math.cos(a) * radius })
    end

    local a = math.rad(0)
    table.insert(poly, { x = x + math.sin(a) * radius, y = y + math.cos(a) * radius })
    self.data = poly
end

function AVATAR:DrawPoly(w, h)
    if (!self.data) then
        self:CalculatePoly(w, h)
    end

    surface.DrawPoly(self.data)
end

function AVATAR:Paint(w, h)
    render.ClearStencil()
    render.SetStencilEnable(true)

    render.SetStencilWriteMask(1)
    render.SetStencilTestMask(1)

    render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
    render.SetStencilPassOperation(STENCILOPERATION_ZERO)
    render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
    render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
    render.SetStencilReferenceValue(1)

    draw.NoTexture()
    surface.SetDrawColor(color_white)
    self:DrawPoly(w, h)

    render.SetStencilFailOperation(STENCILOPERATION_ZERO)
    render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
    render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
    render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
    render.SetStencilReferenceValue(1)

    self.Avatar:PaintManual()

    render.SetStencilEnable(false)
    render.ClearStencil()
end

vgui.Register("ZenUI.Avatar", AVATAR)