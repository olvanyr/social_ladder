event_inherited();


//attack related variable
attack_range = 0;

//knockback related variable
knockback = true;
knockback_speed = 0;

//move related variable
chase_speed = 1;
gravity_speed = 0.4;
grounded = false;
vsp = 0;
vsp_fraction = 0;

jump_cliff = false;

//myasm related variable
experience = 1;

// state related variable
state = "idle";

// save and load

once = true; //use to make the sav script happen only once when the enemy is dead


save_x = string(id) + string(save.x);
save_y = string(id) + string(save.y);
save_state = string(id) + string(save.state);


if global.enemies[?save_state] == "dead"
{
	state = global.enemies[?save_state];
	x = global.enemies[?save_x];
	y = global.enemies[?save_y];
}else set_enemies_map();