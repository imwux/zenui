# Dropdown (ZenUI.Dropdown)
Derives from [DButton](https://wiki.facepunch.com/gmod/DButton).

## Methods
`void DROPDOWN:SetOpen( boolean value )`  
Toggles the dropdown state manually.

`void DROPDOWN:SetValue( any value )`  
Sets the dropdown value. Only allows for values added to the dropdown and nil.

`void DROPDOWN:AddValue( any value, string label )`  
Adds a new value to the dropdown, duplicates will throw errors.  
It also allows for adding nil HOWEVER when using nil, the label will be ignored and will default to the placeholder.  
Lastly, note that duplicate labels will get (#) appended to them.

`void DROPDOWN:SetPlaceholder( string value )`  
Sets the placeholder (the default value shown and the nil value).

`void DROPDOWN:SetColor( Color color )`  
Sets the background color of the dropdown.

`void DROPDOWN:SetFontSize( number size )`  
Sets the font size of the dropdown.

`boolean DROPDOWN:IsMenuOpen()`  
Returns the state of the dropdown.

`any DROPDOWN:GetValue()`  
Returns the selected value.

`string DROPDOWN:GetPlaceholder()`  
Returns the placeholder.

`Color DROPDOWN:GetColor()`  
Returns the background color of the dropdown

# Events
`void DROPDOWN:OnValueChange( any value )`
This method is called whenever the state of the dropdown changes.

## Example
```lua
local dropdown = vgui.Create("ZenUI.Dropdown")
dropdown:Dock(TOP)
dropdown:SetPlaceholder("Value One")
dropdown:AddValue("2", "Value Two")
dropdown:AddValue(7, "Seven")
dropdown:AddValue(nil)
```
[Back](../main.md)