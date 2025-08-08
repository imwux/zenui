# Window (ZenUI.Window) 
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).

## Methods
`void WINDOW:SetTitle( string title )`  
Sets the title of the window.

`void WINDOW:SetColor( Color color )`  
Sets the background color of the window.

`void WINDOW:SetTextColor( Color color )`  
Sets the title color of the window.

`string WINDOW:GetTitle()`  
Returns the title of the window.

`void WINDOW:GetColor()`  
Returns the background color of the window.

`void WINDOW:GetTextColor()`  
Returns the title color of the window.

## Example
```lua
local window = vgui.Create("ZenUI.Window")
window:SetSize(800, 500)
window:Center()

-- Docks a button to the top of the window
window.Button = window:Add("ZenUI.Button")
window.Button:Dock(TOP)
```
[Back](../main.md)