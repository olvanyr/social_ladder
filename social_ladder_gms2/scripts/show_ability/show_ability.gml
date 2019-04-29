/// @description shaow_ability
/// @arg ability

var ability = argument0;
var c = c_black;
var half_width = window_get_width()/2;
var half_height = window_get_height()/2;

alpha += 0.01;
draw_set_alpha(alpha);
draw_rectangle_color(-10,-10,5000,5000,c,c,c,c,false);
draw_sprite(string("sAbility") + string(ability),0,half_width,half_height);
draw_set_alpha(1);
if alpha >= 1
{
	
}