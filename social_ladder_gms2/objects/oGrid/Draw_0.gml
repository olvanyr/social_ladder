/*
draw_set_font(fDial);
if ds_exists(global.ds_grid_pathfinding,ds_type_grid)
{
	for(var i = 0; i < ds_grid_width(global.ds_grid_pathfinding); i++)
	{
		for(var j = 0; j < ds_grid_height(global.ds_grid_pathfinding); j++)
		{
			var value = ds_grid_get(global.ds_grid_pathfinding,i,j); //value of the current cell in the grid
			draw_text_ext_transformed(i*cell_width + 16, j*cell_height + 16, string(value),1,200,1,1,0)
		}
	}
}