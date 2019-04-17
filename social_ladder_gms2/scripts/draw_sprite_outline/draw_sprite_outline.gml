/// @description draw sprite outline
/// @arg sprite
/// @arg image_index
/// @arg x
/// @arg y
/// @arg size
/// @arg color


var sprite = argument0;
var image = argument1;
var _x = argument2;
var _y = argument3;
var buffer = argument4;
var c = argument5;
draw_sprite_ext(sprite,image,_x-buffer,_y-buffer,image_xscale, image_yscale, 0,c,1);
draw_sprite_ext(sprite,image,_x+buffer,_y+buffer,image_xscale, image_yscale, 0,c,1);
draw_sprite_ext(sprite,image,_x+buffer,_y-buffer,image_xscale, image_yscale, 0,c,1);
draw_sprite_ext(sprite,image,_x-buffer,_y+buffer,image_xscale, image_yscale, 0,c,1);