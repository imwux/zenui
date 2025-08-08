# Sidebar (ZenUI.Sidebar) 
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).  
Should always be docked to the left.

## Methods
`void SIDEBAR:AddButton( string title, string description, string element )`  
Adds a new button to the sidebar, the element is a vgui element that will be created when the button is selected.

`void SIDEBAR:SetTarget( Panel element )`  
Sets the target for the vgui element that gets created. It will be created as a child of the target and set to fill the target.

`void SIDEBAR:SetAnimate( boolean state )`
Sets if the sidebar content should slide in or appear.

`void SIDEBAR:SetColor( Color color )`  
Sets the background color.

`void SIDEBAR:SetAccentColor( Color color )`  
Sets the accent color.

`void SIDEBAR:SetTitleColor( Color color )`  
Sets the title color.

`void SIDEBAR:SetDescriptionColor( Color color )`  
Sets the description color.

`Color SIDEBAR:GetColor()`  
Returns the background color.

`Color SIDEBAR:GetAccentColor()`  
Returns the accent color.

`Color SIDEBAR:GetTitleColor()`  
Returns the title color.

`Color SIDEBAR:GetDescriptionColor()`  
Returns the description color.

## Example
```lua
local sidebar = vgui.Create("ZenUI.Sidebar")
sidebar:Dock(LEFT)
```
[Back](../main.md)