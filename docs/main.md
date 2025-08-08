# Important Points
- Hook into ZenUI using the loaded hook (`ZenUI_Loaded`) before loading any vgui code using ZenUI. Here is a quick snippet on how to do that
```lua
local function Initialize()
    print("ZenUI is guaranteed to be initialized here :D")
end

if !_G.ZenUI or !ZenUI.Loaded then
    hook.Add("ZenUI_Loaded", "YourAddon_ZenUI_Loaded", Initialize)
else
    Initialize()
end
```
- Type checking is up to you. Meaning if you pass a string to a function that wants a number, it will throw errors.

# ZenUI Components

- [Panel](./components/panel.md)
- [Window](./components/window.md)
- [Sidebar](./components/sidebar.md)
- [Label](./components/label.md)
- [Button](./components/button.md)
- [TextEntry](./components/textentry.md)
- [TitleGroup](./components/titlegroup.md)
- [Avatar](./components/avatar.md)
- [Dropdown](./components/dropdown.md)
- [Slider](./components/slider.md)
- [Switch](./components/switch.md)
- [Scroll](./components/scroll.md)