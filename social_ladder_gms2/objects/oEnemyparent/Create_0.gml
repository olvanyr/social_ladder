

event_inherited();

attack_range = 0;
knockback = true;
knockback_speed = 0;

gravity_speed = 0.4;
grounded = false;
vsp = 0;
vsp_fraction = 0;

state = "idle";


// save and load 
ident = id;

once = true; //use to make the sav script happen only once when the enemy is dead



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
} else 
{
	//set ennemy state
	set_enemies_array();
}

/*
var str = "";
var array = variable_instance_get_names(id);
show_debug_message("Variables for " + object_get_name(object_index) + string(id));
for (var i = 0; i < array_length_1d(array); i++;)
    {
    str = array[i] + ":" + string(variable_instance_get(id, array[i]));
    show_debug_message(str);
    }


