event_inherited();


//attack related variable
attack_range = 0;

//knockback related variable
knockback = true;
knockback_speed = 0;

//move related variable
gravity_speed = 0.4;
grounded = false;
vsp = 0;
vsp_fraction = 0;

//myasm related variable
experience = 1;

// state related variable
state = "idle";

// save and load 
ident = id;

once = true; //use to make the sav script happen only once when the enemy is dead



var array;

if is_array(global.enemies[?ident])
{
	
	array = global.enemies[?ident];

	if array[save.state] == "dead"
	{
	
		x = array[save.x];
		y = array[save.y];
		state = array[save.state];
	}
} else 
{
	//set ennemy state
	set_enemies_array();
}
