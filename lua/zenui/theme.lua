--[[
    ZenUI By ImWuX
    Theme
]]--

ZenUI.Themes = ZenUI.Themes or {}

ZenUI.Themes["Dark"] = {
    Primary = Color(28, 28, 30),
    Secondary = Color(44, 44, 46),
    Tertiary = Color(56, 56, 58),
    Text = Color(250, 250, 250),
    SecondaryText = Color(175, 175, 175),
    Accent = Color(147, 36, 252)
}

ZenUI.SetTheme = function(theme)
    ZenUI.Colors = ZenUI.Themes[theme]
end

ZenUI.SetTheme("Dark")