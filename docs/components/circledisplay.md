# CircleDisplay (ZenUI.CircleDisplay)
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).


## Methods
`void CIRCLEDISPLAY:SetTitle( string title )`  
Sets the title of the circle display.

`void CIRCLEDISPLAY:SetColor( Color color )`  
Sets the color of the circle display.

`void CIRCLEDISPLAY:SetProgress( number/function progress )`  
Sets the progress of the circle display.

`void CIRCLEDISPLAY:SetMaxProgress( number/function progress )`  
Sets the max progress of the circle display.

`string CIRCLEDISPLAY:GetTitle()`  
Returns the title of the circle display.

`Color CIRCLEDISPLAY:GetColor()`  
Returns the color of the circle display.

## Example
```lua
local progress = 100
local circleDisplay = vgui.Create("ZenUI.CircleDisplay")
circleDisplay:SetTitle("Sample CircleDisplay")
circleDisplay:SetMaxProgress(200)
circleDisplay:SetProgress(function()
    return progress
end)
```
[Back](../main.md)