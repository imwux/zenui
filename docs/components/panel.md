# Panel (ZenUI.Panel) 
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).

## Methods
`void PANEL:SetColor( Color color )`  
Sets the panel background color.

`Color PANEL:GetColor()`  
Returns the panel background color.

## Example
```lua
local panel = vgui.Create("ZenUI.Panel")
panel:SetSize(500, 500)
panel:Center()
```
[Back](../main.md)