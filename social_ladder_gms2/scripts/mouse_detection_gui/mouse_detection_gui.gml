/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2

var _x1 = argument0; 
var _y1 = argument1; 
var _x2 = argument2; 
var _y2 = argument3; 

if (device_mouse_x_to_gui(0) > _x1 && device_mouse_x_to_gui(0) < _x2 && device_mouse_y_to_gui(0) > _y1 && device_mouse_y_to_gui(0) < _y2)
{
	return true;
}