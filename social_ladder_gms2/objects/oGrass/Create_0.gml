/// @description Insert description here

distance_to_bottom = 0;
distance_to_top = 0;

dir = 0;

position = "front";



back_color = make_colour_hsv(22, 17, 17);



rng = irandom_range(1,5);
if rng == 5
{
	layer = layer_get_id("Enemies");
	image_blend = back_color;
}else
{
	image_blend = c_black;
}


while !place_meeting(x,y + other.distance_to_bottom, oWall)
{
	other.distance_to_bottom++;
}
while !place_meeting(x,y - other.distance_to_top, oWall)
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

grass[12] = sGrass12;
grass[11] = sGrass11;
grass[10] = sGrass10;
grass[9] = sGrass09;
grass[8] = sGrass08;
grass[7] = sGrass07;
grass[6] = sGrass06;
grass[5] = sGrass05;
grass[4] = sGrass04;
grass[3] = sGrass03;
grass[2] = sGrass02;
grass[1] = sGrass01;

rng = irandom_range(1,array_length_1d(grass)-1);

sprite_index = grass[rng];


xskew = 0;
xset = 0;


