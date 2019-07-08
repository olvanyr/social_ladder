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
	set_state_sprite(sPlayer_projectile_hitspark,1,0);
	spd = 0;
	instance_change(oHitspark,true)
}


if place_meeting(x + 1, y, oWall)
{
	set_state_sprite(sPlayer_projectile_hitspark,1,0);
	spd = 0;
	instance_change(oHitspark,true)
}
if place_meeting(x - 1, y, oWall)
{
	set_state_sprite(sPlayer_projectile_hitspark,1,0);
	spd = 0;
	instance_change(oHitspark,true)
}
if place_meeting(x, y + 1, oWall)
{
	set_state_sprite(sPlayer_projectile_hitspark,1,0);
	spd = 0;
	instance_change(oHitspark,true)
}
if place_meeting(x, y - 1, oWall)
{
	set_state_sprite(sPlayer_projectile_hitspark,1,0);
	spd = 0;
	instance_change(oHitspark,true)
}