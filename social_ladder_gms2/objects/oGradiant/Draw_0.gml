

if global.zone == "rDz"
{
	draw_sprite_tiled(sDz_back,0,0,0);
}else
{
	var c1 = color1;
	var c2 = color2;

	draw_rectangle_color(-10,-10,room_width + 10,room_height + 10,c1,c1,c2,c2,false);
}