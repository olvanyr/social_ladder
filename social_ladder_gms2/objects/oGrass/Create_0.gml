/// @description Insert description here

distance_to_bottom = 0;
distance_to_top = 0;

dir = 0;

color = c_black;
back_color = make_colour_hsv(22, 17, 17);

var splits = split_string(string(room_get_name(room)),"_");

if splits[0] == "rDz"
{
	color = c_white;
	back_color = make_colour_hsv(0, 0, 78);
}

rng = irandom_range(1,5);
if rng == 5
{
	if !layer_exists("Grass_back")
	{
		layer_create(depth_layer.grass_back,"Grass_back");
	}
	layer_depth(layer_get_id("Grass_back"), depth_layer.grass_back);
	layer = layer_get_id("Grass_back");
	
	image_blend = back_color;
}else
{
	if !layer_exists("Effects")
	{
		layer_create(depth_layer.effects,"Effects");
	}
	layer_depth(layer_get_id("Effects"), depth_layer.effects);
	layer = layer_get_id("Effects");
	
	image_blend = color;
}

while !place_meeting(x,y + other.distance_to_bottom, oWall) && other.distance_to_bottom < 1000
{
	other.distance_to_bottom++;
}
while !place_meeting(x,y - other.distance_to_top, oWall) && other.distance_to_top < 1000
{
	other.distance_to_top++;
}

if distance_to_bottom <= distance_to_top
{
	dir = 270;
	image_yscale = 1;
}else
{
	dir = 90;
	image_yscale = -1;
}
move_contact_solid(dir, -1);


image_speed = 0;




if splits[0] == "rLab" || splits[0] == "rPla" || splits[0] == "rDz"
{
	grass = global.grass;
}

if splits[0] == "rFor"
{
	grass = global.forest_grass;
}

rng = irandom_range(1,array_length_1d(grass)-1);



sprite_index = grass[rng];


xskew = 0;
xset = 0;
/*
show_debug_message("distance to bottom : " + string(distance_to_bottom));
show_debug_message("distance to top : " + string(distance_to_top));
show_debug_message("distance to top platform : " + string(distance_to_top_platform));


