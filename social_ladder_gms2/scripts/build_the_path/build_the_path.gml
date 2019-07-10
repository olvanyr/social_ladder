/// @description build_the_pat(x_goal,y_goal);
/// @arg x_goal
/// @arg y_goal

var x_goal = argument0;
var y_goal = argument1;

path_building = path_add(); // create a path wher we want to go
var value; // value in the ennemy grid
var x_previous; // voordinat of prévious x
var a = -1; // use when ennemy fall. We use it to store data from the pathfinding grid
var b = -1; // use when ennemy fall. We use it to store data from the pathfinding grid
var n = 0; // use when ennemy fall.

path_add_point(path_building, x_goal*oGrid.cell_width + (oGrid.cell_width/2),y_goal*oGrid.cell_height + (oGrid.cell_height/2),100); // initialize the first point of the path (we take the point reversed)
value = ds_grid_get(ds_grid_pathfinding,x_goal,y_goal); // value in the pathfinding grid to go to the goal position

for (var i = value - 1;i > 0;i -= 1) // we loop to store all the need
{
	x_previous = x_goal; 
	n = 0;
		if ds_grid_value_exists(ds_grid_pathfinding, x_goal - 1, y_goal, x_goal + 1, y_goal + 1, i) // Check if the value of i exist inside a rectanglze arround the goal, and if yes, we add the pointinside the path
		{
			x_goal = ds_grid_value_x(ds_grid_pathfinding, x_goal-1,y_goal, x_goal+1,y_goal+1,i);  // Store the X coordinate in x_goal so we sate the new goal
			y_goal = ds_grid_value_y(ds_grid_pathfinding, x_previous-1,y_goal, x_previous+1,y_goal+1,i); // Store the Y coordinate in y_goal so we sate the new goal
			path_add_point(path_building, x_goal*oGrid.cell_width + (oGrid.cell_width/2), y_goal*oGrid.cell_height +(oGrid.cell_height/2), 100); // Add point in path
		}else
		{
            if ds_grid_value_exists(ds_grid_pathfinding, x_goal-2,y_goal, x_goal+2,y_goal+1, i) /// Check if diagonal jump (big jump) or Horizontal jump (jump over a void)
            {
            x_goal = ds_grid_value_x(ds_grid_pathfinding, x_goal-2,y_goal, x_goal+2,y_goal+1,i);
            if ds_grid_get (ds_grid_pathfinding, x_previous + sign(x_goal-x_previous), y_goal) == -1 /// Check if enemy could really jump
            {
	            y_goal = ds_grid_value_y(ds_grid_pathfinding, x_previous-2,y_goal, x_previous+2,y_goal+1,i);
	            path_add_point(path_building, x_goal*oGrid.cell_width + (oGrid.cell_width/2), y_goal*oGrid.cell_height +(oGrid.cell_height/2), 100);
            }
            else{      /// Case where he find a oWall, means that we cannot reach it. Means that we have to fall.
                    {
                    do
                    {
	                    n=n+1 ;
	                    a= ds_grid_get(ds_grid_pathfinding,x_previous-1,y_goal-n);
	                    b= ds_grid_get(ds_grid_pathfinding,x_previous+1,y_goal-n);
                    }
                    until (a==i) || (b==i) || ((y_goal-n) < 0)
                    }
					
                    if ds_grid_value_exists(ds_grid_pathfinding, x_previous-1,y_goal-n, x_previous+1,y_goal-n, i)
                    {
                        x_goal = ds_grid_value_x(ds_grid_pathfinding, x_previous-1,y_goal-n, x_previous+1,y_goal,i);
                        y_goal = ds_grid_value_y(ds_grid_pathfinding, x_previous-1,y_goal-n, x_previous+1,y_goal,i);
                        path_add_point(path_building, x_goal*oGrid.cell_width + (oGrid.cell_width/2), y_goal*oGrid.cell_height +(oGrid.cell_height/2), 100);
                    }
			}
            }else
			{  /// When enemy fall
                {
                do
                {
	                n=n+1 ;
	                a= ds_grid_get(ds_grid_pathfinding,x_previous-1,y_goal-n);
	                b= ds_grid_get(ds_grid_pathfinding,x_previous+1,y_goal-n);
                }
                until (a==i) || (b==i) || ((y_goal-n) < 0)
                }
				
                if ds_grid_value_exists(ds_grid_pathfinding, x_previous-1,y_goal-n, x_previous+1,y_goal-n, i)
                {
                    x_goal = ds_grid_value_x(ds_grid_pathfinding, x_previous-1,y_goal-n, x_previous+1,y_goal,i);
                    y_goal = ds_grid_value_y(ds_grid_pathfinding, x_previous-1,y_goal-n, x_previous+1,y_goal,i);
                    path_add_point(path_building, x_goal*oGrid.cell_width + (oGrid.cell_width/2), y_goal*oGrid.cell_height +(oGrid.cell_height/2), 100);
                }
			}
		}
		
}

path_add_point(path_building, floor(x/oGrid.cell_width)*oGrid.cell_width+(oGrid.cell_width/2),floor(y/oGrid.cell_height)*oGrid.cell_height+(oGrid.cell_height/2), 100);  /// We add the last point which is the point where there is the enemy.
path_set_closed(path_building,0); /// We didn't close the path because it is an open path. We don't to have loop in this path.
path_reverse(path_building);  // We reverse the path because we start from the end.
