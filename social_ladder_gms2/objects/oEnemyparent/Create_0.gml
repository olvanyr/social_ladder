

event_inherited();

attack_range = 0;
knockback = true;
knockback_speed = 0;

gravity_speed = 0.4;
grounded = false;
vsp = 0;
vsp_fraction = 0;

state = "idle";


//set ennemy state

if global.ennemies_array[self,save.state] != noone
{
	if global.ennemies_array[self,save.state] == "death"
	{
		state = "death";
		x = global.ennemies_array[self,save.x];
		y = global.ennemies_array[self,save.y];
		
	}
	
}