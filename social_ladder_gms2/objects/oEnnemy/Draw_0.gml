draw_self();

//draw the grid
if ds_exists(ds_grid_pathfinding,ds_type_grid)
{
	for(var i = 0; i < ds_grid_width(ds_grid_pathfinding); i++)
	{
		for(var j = 0; j < ds_grid_height(ds_grid_pathfinding); j++)
		{
			var value = ds_grid_get(ds_grid_pathfinding,i,j); //value of the current cell in the grid
			
			draw_text_ext_transformed(i*oGrid.cell_width + 32, j*oGrid.cell_height + 32, string(value),1,200,1,1,0)
		}
	}
	draw_set_color(c_white);
}

if path_exists(path_building)
{
	draw_set_color(c_green);
	draw_path(path_building, floor(x/oGrid.cell_width), floor(y/oGrid.cell_height),true);
	draw_set_color(c_white);
}