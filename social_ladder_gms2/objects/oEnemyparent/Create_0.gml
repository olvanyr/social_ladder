

event_inherited();

attack_range = 0;
knockback = true;
knockback_speed = 0;

gravity_speed = 0.4;
grounded = false;
vsp = 0;
vsp_fraction = 0;

state = "idle";


// I have to do that beacause id start at 100000 and the array can only store value under 32000 or something like that
ident = id - 99900;

//set ennemy state
global.enemies[ident,save.state] = state;
global.enemies[ident,save.x] = x;
global.enemies[ident,save.y] = y;

if global.enemies[ident,save.state] == "death"
{
	state = "death";
	x = global.enemies[ident,save.x];
	y = global.enemies[ident,save.y];
}


