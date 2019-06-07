/// @description shaow_ability
/// @arg ability

var c = c_black;
var half_width = display_get_gui_width()/2;
var half_height = display_get_gui_height()/2;

alpha += 0.01;
draw_set_alpha(alpha);
draw_rectangle_color(-10,-10,5000,5000,c,c,c,c,false);

var sprite = string("sAbility_") + string(ability);
sprite = asset_get_index(sprite);
draw_sprite(sprite,0,half_width,half_height);

draw_set_alpha(1);


if alpha >= 1
{
	if oPlayer.input.use 
	{
		showcase = false;
		ability = noone;
		alpha = 0;
	}
}

