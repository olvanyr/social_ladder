image = draw_sprite(door_sprite, animation_frame, x,y);

if collision_rectangle(x - 30,y - 30,x,y,oPlayer,false,false) && door_status == "closed"
{
	draw_sprite(sUse,0,x,y);
}