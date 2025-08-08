--[[
    ZenUI By ImWuX
    ZenUI_Autorun
]]--

ZenUI = ZenUI or {}
ZenUI.Loaded = false

function ZenUI.Include(file)
    if SERVER then
        AddCSLuaFile(string.format("zenui/%s.lua", file))
    end
    if CLIENT then
        include(string.format("zenui/%s.lua", file))
    end
    print(string.format("Included %s", file))
end

function ZenUI.IncludeDir(dir)
    local files, folders = file.Find(string.format("zenui/%s/*", dir), "LUA")
    for _, v in pairs(files) do
        ZenUI.Include(string.format("%s/%s", dir, string.StripExtension(v)))
    end
end

function ZenUI.Initialize()
    print(" ")
	print("#           Loading ZenUI Files...      #")

	-- Load Fonts
	resource.AddFile("resource/fonts/montserrat-medium.ttf")
    resource.AddFile("materials/zenui/block.png")

    ZenUI.IncludeDir("libs")
    ZenUI.Include("utils")
    ZenUI.Include("theme")
    ZenUI.IncludeDir("components")

	print("")
	print("#              All Files Loaded              #")
	print("#               ZenUI by ImWuX               #")

	-- Call Custom Hook
	hook.Run("ZenUI_Loaded")
	ZenUI.Loaded = true
end

ZenUI.Initialize()