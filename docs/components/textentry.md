# TextEntry (ZenUI.TextEntry)
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).  
A [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) is built in as a child component.

## Methods
`void TextEntry:SetValue( string value )`  
Sets the value of the textentry.

`void TextEntry:SetPlaceholderText( string text )`  
Sets the placeholder text (the text that shows up when the textentry is empty).

`void TextEntry:SetAccentColor( Color color )`  
Sets the accent color.

`void TextEntry:SetColor( Color color )`  
Sets the background color of the textentry.

`void TextEntry:SetTextColor( Color color )`  
Sets the text color.

`void TextEntry:SetPlaceholderColor( Color color )`  
Sets the placeholder text color.

`void TextEntry:SetFontSize( number size )`  
Sets the font size of the text.

`string TextEntry:GetValue()`  
Returns the value of the textentry.

`string TextEntry:GetPlaceholderText()`  
Returns the placeholder text.

`Color TextEntry:GetAccentColor()`  
Returns the accent color.

`Color TextEntry:GetColor()`  
Returns the background color.

`Color TextEntry:GetTextColor()`  
Returns the text color.

`Color TextEntry:GetPlaceholderColor()`  
Returns the placeholder text color.

# Events
`void SWITCH:OnValueChange( string value )`  
This method is called whenever the state of the textentry changes.

## Example
```lua
local textentry = vgui.Create("ZenUI.TextEntry")
textentry:SetPlaceholder("Username")
textentry:Dock(TOP)
```
[Back](../main.md)