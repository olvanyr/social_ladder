// Inherit the parent event
event_inherited();

//draw roll cooldawn

var roll_image_number = sprite_get_number(sRoll_cooldawn);
var sub_image = round(roll_cooldown / roll_image_number);

if roll_cooldown > 0 && state != "roll"
{
	draw_sprite(sRoll_cooldawn,sub_image,x,y);
}

draw_rectangle(x,y,x + (image_xscale * half_mask_width), y-20,false);