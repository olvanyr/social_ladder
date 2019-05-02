if flash <= 0 
{
//draw an outline
draw_sprite_outline(sprite_index, image_index,x,y,0.5,c_dkgray);

}

// Inherit the parent event
event_inherited();

//draw roll cooldawn
var roll_image_number = sprite_get_number(sRoll_cooldawn);
var sub_image = round(roll_cooldown / roll_image_number);

if roll_cooldown > 0 && state != "roll"
{
	draw_sprite(sRoll_cooldawn,sub_image,x,y);
}

var c = c_red;
draw_rectangle_color(x + (image_xscale * 30), y - (10),x + (image_xscale * 30)+1, y - (10)+1,c,c,c,c,false);
