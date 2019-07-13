// Follow the path if path exists
if path_exists(path_building)
{
	follow_the_path(path_building);
}

if vsp == 0 grounded = true;

move_and_collide(hsp,0);

pathfinding_timer ++;

if instance_exists(oPlayer)
{
	if pathfinding_timer >= 10 && oPlayer.grounded
	{
		pathfinding_timer = 0;
				if path_exists(path_building) {
				path_delete (path_building);
			}
			path_point = 0 ;
			action = 0 ;
			jump_action = 0 ;

		fill_the_grid(floor(x/oGrid.cell_width), floor(y/oGrid.cell_height), floor(oPlayer.x/oGrid.cell_width), floor(oPlayer.y/oGrid.cell_height));
	}
}
				
image_xscale = sign(hsp);
if image_xscale == 0 image_xscale = 1;
				
if hsp == 0
{
	set_state_sprite(idle,idle_spd,0);
}
				
if vsp > 0
{
	set_state_sprite(jump_up,0,1);
}
if vsp < 0
{
	set_state_sprite(jump_up,0,0);
}
				
// get the absolute distance to the player
var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
				
// if the player is close enought hit him
if distance_to_player <= attack_range
{
	state = "attack";
}
				
if distance_to_player <= attack_range + 5 && irandom(4) == 1 && roll_cooldown <= 0
{
	state = "roll";
}