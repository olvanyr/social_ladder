pathfinding_timer = 0;

// initialise te black color for debuging 
draw_set_color(c_black);

// inbitialize variable in order to draw grid and path
ds_grid_pathfinding = noone;
path_building = noone;

//move

hsp = 0;
vsp = 0;

move_spd = 1.7;
jump_spd = -10;

gravity_spd = 1;

move = 0;

grounded = false

// Variable to follow the path
action = 0;
path_point = 0;
jump_action = 0;

if !instance_exists(oGrid)
{
	instance_create_layer(0,0,"Instances",oGrid);
}