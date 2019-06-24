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
}else instance_destroy();

