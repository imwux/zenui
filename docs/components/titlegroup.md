# TitleGroup (ZenUI.TitleGroup)
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).  
**Note:** Whenever fontsize is changed or a subtitle is added/removed. The component will automatically adjust its height.

## Methods
`void Title:SetTitleText( string text )`  
Sets the title text.

`void Title:SetSubTitleText( string text )`  
Sets the subtitle text.

`void Title:SetTitleTextColor( Color color )`  
Sets the color of the title.

`void Title:SetSubTitleTextColor( Color color )`  
Sets the color of the subtitle.

`void Title:SetTitleFontSize( number size )`  
Sets the font size of the title.

`void Title:SetSubTitleFontSize( number size )`  
Sets the font size of the subtitle.

`string Title:GetTitleText()`  
Returns the title text.

`string Title:GetSubTitleText()`  
Returns the subtitle text.

`Color Title:GetTitleTextColor()`  
Returns the color of the title.

`Color Title:GetSubTitleTextColor()`  
Returns the color of the subtitle.

## Example
```lua
local titlegroup = vgui.Create("ZenUI.TitleGroup")
titlegroup:SetTitleText("Test Title")
titlegroup:SetSubTitleText("Testing the subtitle.")
titlegroup:Dock(TOP)
```
[Back](../main.md)