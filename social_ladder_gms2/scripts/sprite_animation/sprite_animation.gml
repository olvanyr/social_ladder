/// @description anime_draw_sprite

/// @arg sprite_to_anim
/// @arg y_buffer
/// @arg animation_speed
/// @arg x
/// @arg y

var sprite = argument0;
var marge = argument1;
var animation_speed = argument2;
var _x = argument3;
var _y = argument4;

var _image_number = sprite_get_number(sprite);
image_counter += animation_speed;
var sub_image = image_counter;
if sub_image == _image_number 
{
	_image_number = 0;
}
draw_sprite(sprite,image_counter,_x + marge,_y);