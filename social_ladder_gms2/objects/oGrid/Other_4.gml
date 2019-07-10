enum grid 
{
	empty = -1,
	wall = -2
}
var width_cells = ceil(room_width/cell_width);
var height_cells = ceil(room_height/cell_height);

global.ds_grid_pathfinding = ds_grid_create(width_cells, height_cells);

for(var i = 0; i < width_cells; i++)
{
	for(var j = 0; j < height_cells; j++)
	{
		if place_meeting(i*cell_width,j*cell_height,oWall)
		{
			ds_grid_add(global.ds_grid_pathfinding,i,j,grid.wall);
		}else
		{
			ds_grid_add(global.ds_grid_pathfinding,i,j,grid.empty);
		}
	}
}