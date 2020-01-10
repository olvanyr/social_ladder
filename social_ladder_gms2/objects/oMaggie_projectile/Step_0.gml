//Aplly gravity
vsp += gravity_speed;


//Re apply fractions
vsp += vsp_fraction;

direction = point_direction(x,y,x + hsp,y + vsp);
image_angle = direction;

//Store and Remove fractions
vsp_fraction = frac(vsp);
vsp -= vsp_fraction;

if !grounded
{
	move_and_collide(hsp,vsp);
}else 
{
	spd = 0;
	instance_change(oHitspark,true)
	set_state_sprite(sMaggie_projectile_hitspark,1,0);
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

repeat(3)
{
	with (instance_create_layer(x,y,layer,oGround_effect))
	{
	}
}