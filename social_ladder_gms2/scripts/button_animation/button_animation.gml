/// @arg sprite to draw

var sprite = argument0;
var marge = argument1;

var _image_number = sprite_get_number(sprite);
image_counter += 0.03;
var sub_image = image_counter;
if sub_image == _image_number 
{
	_image_number = 0;
}
draw_sprite(sprite,image_counter,x + marge,y);