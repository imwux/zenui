# Label (ZenUI.Label) 
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).

## Methods
`void Label:SetText( string text )`  
Sets the text of the label.

`void Label:SetTextColor( Color color )`  
Sets the color of the label.

`void Label:SetCenteredX( boolean state )`  
Sets whetever the label is centered within its own bounds (horizontally).

`void Label:SetCenteredY( boolean state )`  
Sets whetever the label is centered within its own bounds (vertically).

`void Label:SetFontSize( number size )`  
Changes the font size of the label.

`string Label:GetText()`  
Returns the text of the label.

`Color Label:GetTextColor()`  
Returns the color of the label.

`boolean Label:GetCenteredX()`  
Returns if the label is centered within its own bounds (horizontally).

`boolean Label:GetCenteredY()`  
Returns if the label is centered within its own bounds (vertically).

## Example
```lua
local label = vgui.Create("ZenUI.Label")
label:SetText("Lorem ipsum")
label:Dock(TOP)
```
[Back](../main.md)