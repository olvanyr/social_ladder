x += move_speed * dir;

if place_meeting(x + move_speed, y, oWall)
{
	spd = 0;
	repeat(3)
	{
		with (instance_create_layer(x,y,"Effects",oGround_effect))
		{
			vsp = 0;
		}
	}
	instance_destroy();
}
if place_meeting(x - move_speed, y, oWall)
{
	spd = 0;
	repeat(3)
	{
		with (instance_create_layer(x,y,"Effects",oGround_effect))
		{
			vsp = 0;
		}
	}
	instance_destroy();
}
/*
if place_meeting(x + move_speed, y, oWall)
{
	spd = 0;
	instance_change(oHitspark,true)
	set_state_sprite(sMaggie_projectile_hitspark,1,0);
}
if place_meeting(x - move_speed, y, oWall)
{
	spd = 0;
	instance_change(oHitspark,true)
	set_state_sprite(sMaggie_projectile_hitspark,1,0);
}
