# Avatar (ZenUI.Avatar)
Derives from [Panel](https://wiki.facepunch.com/gmod/Panel).  
An [AvatarImage](https://wiki.facepunch.com/gmod/AvatarImage) is built in as a child component.

## Methods
`void Avatar:SetVertices( number vertices )`  
Sets the amount of vertices for the circular avatar, essentially how smooth it will be (This affects performance though).

`void Avatar:SetRotation( number rotation )`  
Sets the rotation of the avatar.

`void Avatar:SetSteamID64( string steamid64, number size)`  
Loads an image into the avatar using a steamid.

`void Avatar:SetPlayer( Player ply, number size)`  
Loads an image into the avatar using a player entity.

`number Avatar:GetVertices()`  
Returns the amount of vertices.

`number Avatar:GetRotation()`  
Returns the rotation of the avatar.

## Example
```lua
local avatar = vgui.Create("ZenUI.Avatar")
avatar:SetPlayer(player.GetAll()[1], 512)
avatar:SetSize(150, 150)
```
[Back](../main.md)