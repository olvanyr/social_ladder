
move_and_collide(hsp,vsp);

repeat(1)
{
	with (instance_create_layer(x,y,"Effects",oGround_effect))
	{
	}
}

if place_meeting(x + 1, y, oWall)
{
	spd = 0;
	instance_change(oHitspark,true)
	set_state_sprite(sMaggie_projectile_hitspark,1,0);
}
if place_meeting(x - 1, y, oWall)
{
	spd = 0;
	instance_change(oHitspark,true)
	set_state_sprite(sMaggie_projectile_hitspark,1,0);
}
if place_meeting(x, y + 1, oWall)
{
	spd = 0;
	instance_change(oHitspark,true)
	set_state_sprite(sMaggie_projectile_hitspark,1,0);
}
if place_meeting(x, y - 1, oWall)
{
	spd = 0;
	instance_change(oHitspark,true)
	set_state_sprite(sMaggie_projectile_hitspark,1,0);
}