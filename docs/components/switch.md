# Switch (ZenUI.Switch)
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).
A [DButton](https://wiki.facepunch.com/gmod/DButton) is built in as a child component.

# Methods
`void SWITCH:SetValue( boolean value )`  
Sets the value of the switch.

`boolean SWITCH:GetValue()`  
Returns the value of the switch.

`void SWITCH:SetLocked( boolean value )`  
Sets the locked state of the switch.

`boolean SWITCH:GetLocked()`  
Returns the locked state of the switch.

`void SWITCH:SetOnColor( Color color )`  
Sets the color of the switch when turned on.

`Color SWITCH:GetOnColor()`  
Returns the color of the switch when turned on.

`void SWITCH:SetOffColor( Color color )`  
Sets the color of the switch when turned off.

`Color SWITCH:GetOffColor()`  
Returns the color of the switch when turned off.

# Events
`void SWITCH:OnValueChange( boolean value )`  
This method is called whenever the state of the switch changes.

# Example
```lua
local switch = vgui.Create("ZenUI.Switch")
switch:Dock(TOP)
switch:SetTall(20)
switch.OnValueChanged = function(self, value)
    print(string.format("Switch value change to %s", value))
end
```

[Back](../main.md)