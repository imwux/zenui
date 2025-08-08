# Scroll (ZenUI.Scroll) 
Derives from [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel).

## Methods
`void SCROLL:SetColor( Color color )`  
Sets the color of the scroll bar.

`void SCROLL:SetActiveColor( Color color )`  
Sets the color of the scroll bar when dragging it.

`Color SCROLL:GetColor()`  
Returns the color of the scroll bar.

`Color SCROLL:GetActiveColor()`  
Returns the color of the scroll bar when dragging it.

## Example
```lua
local scroll = vgui.Create("ZenUI.Scroll")
scroll:Dock(TOP)
scroll:SetTall(80)
```
[Back](../main.md)