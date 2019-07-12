 

// Follow the path if path exists
if path_exists(path_building)
{
    follow_the_path(path_building);
}

if vsp == 0 grounded = true;

vsp += gravity_spd;

move_and_collide(hsp,vsp);

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