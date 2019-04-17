/// @description draw text color & outline
/// @arg x
/// @arg y
/// @arg size
/// @arg string
/// @arg color
/// @arg alpha


var _x = argument0;
var _y = argument1;
var buffer = argument2;
var _string = argument3;
var c = argument4;
var alpha = argument5;
draw_text_color(_x+buffer,_y+buffer,_string,c,c,c,c,alpha);
draw_text_color(_x-buffer,_y-buffer,_string,c,c,c,c,alpha);
draw_text_color(_x-buffer,_y+buffer,_string,c,c,c,c,alpha);
draw_text_color(_x+buffer,_y-buffer,_string,c,c,c,c,alpha);
draw_text_color(_x+buffer,_y,_string,c,c,c,c,alpha);
draw_text_color(_x-buffer,_y,_string,c,c,c,c,alpha);
draw_text_color(_x,_y-buffer,_string,c,c,c,c,alpha);
draw_text_color(_x,_y+buffer,_string,c,c,c,c,alpha);
