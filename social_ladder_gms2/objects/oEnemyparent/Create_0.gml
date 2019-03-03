

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
ident = id;

//set ennemy state

/// @description load data


var array;

if is_array(global.enemies[?ident])
{
	
	array = global.enemies[?ident];

	if array[save.state] == "death"
	{
	
		x = array[save.x];
		y = array[save.y];
		state = array[save.state];
	}
}

array[save.state] = state;
array[save.x] = x;
array[save.y] = y;

//array[save.room] = room_id;

global.enemies[?ident] = array;


