# Slider (ZenUI.Slider)
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).

## Methods
`void SLIDER:SetValue( number value )`  
Sets the current value of the slider

`void SLIDER:SetColor( Color color )`  
Sets the color of the bar.

`void SLIDER:SetKnobColor( Color color )`  
Sets the color of the knob.

`void SLIDER:SetMinMax( number min, number max )`  
Sets the minimum and maximum value of the slider.

`void SLIDER:SetRound( number decimals )`  
Sets the number of decimals the slider should round to.  
(Two will make it jump between whole numbers)

`number SLIDER:GetValue()`  
Returns the current value of the slider.

`Color SLIDER:GetColor()`  
Returns the color of the bar.

`Color SLIDER:GetKnobColor()`  
Returns the color of the knob.

`number, number SLIDER:GetMinMax()`  
Returns the minimum and maximum value of the slider.

`number SLIDER:GetRound()`  
Returns the number of decimals the slider should round to.

# Events
`void SWITCH:OnValueChange( number value )`  
This method is called whenever the state of the slider changes.

## Example
```lua
local slider = vgui.Create("ZenUI.Slider")
slider:Dock(TOP)
slider:SetRound(0)
slider:SetMinMax(0, 100)
slider:SetValue(50)
```
[Back](../main.md)