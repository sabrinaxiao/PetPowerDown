// Create a handler object that deals with keeping track and creating a ton of
// important variables. See the comments inside of it's object for more info.
var handler
handler = instance_create_depth(x, y, 0, obj_handler)

// Move the player to a position where they look normal
x += global.tile_size/2
y += global.tile_size/2

// Orient our audio listener so that it works properly
audio_listener_orientation(0,0,-1,0,1,0)
