/// @description fill_the_grid(x,y,x_target,y_target)
/// @arg x
/// @arg y
/// @arg target_x
/// @arg target_y

var _x = argument0;   // Start X position
var _y = argument1;    // Start Y position
var x_goal = argument2;   // X Position where we want to go
var y_goal = argument3 ;  // Y Position where we want to go
var path_found ;      // A w_y was found
var n ;  // Variable when you fall
var a ; // Variable when you fall
path_found = 0;  // 0 means that the path is not found

/// Copy the global pathfinding
ds_grid_pathfinding = ds_grid_create(ds_grid_width(global.ds_grid_pathfinding), ds_grid_height(global.ds_grid_pathfinding)) ;
ds_grid_copy (ds_grid_pathfinding, global.ds_grid_pathfinding);

/// Add the first point into the list
var point_list = ds_list_create() ;
ds_list_add (point_list, _x);
ds_list_add (point_list, _y);
ds_grid_set(ds_grid_pathfinding,_x,_y,0);

for (var i=1; i<200; i+=1)
{
    if path_found == 1 {
    ds_list_destroy(point_list); // We don't need the list anymore because we find a path.
    ds_grid_destroy(ds_grid_pathfinding); /// Grid has to be delete. We keep it only for debuger purposes
    return path_found ;
    break ;
    }

var size_list = ds_list_size(point_list) ;  // Update the size of the list. It is for delete all the previous points.

if size_list == 0 {    // When size list is zero, it means that, we check all the positions where the enemy could go, and no one is the goal position
ds_list_destroy(point_list);   // Destroy the list because it takes up memory and we don't need it anymore.
ds_grid_destroy(ds_grid_pathfinding); // // Destroy the grid because it takes up memory.
return path_found ;  /// It will return 0, so if script returns 0, it means that no path was found to reach the goal.
break ;
}


for (var j=0; j<size_list; j+=2){
        _x = ds_list_find_value(point_list,j)
        _y = ds_list_find_value(point_list,j+1)

        if _x==x_goal && _y==y_goal {
        path_found = 1 ;
        build_the_path(x_goal,y_goal);
        break ;
        }

n=1 ; /// Variable for the Fall

/// Check if the enemy can go to the right
if ds_grid_get(ds_grid_pathfinding,_x+1,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x+1,_y+1)==-2 {
ds_grid_set(ds_grid_pathfinding,_x+1,_y,i);
ds_list_add (point_list, _x + 1);
ds_list_add (point_list, _y);
}

else{   /// If the enemy can go to the right, the other movement will be impossible. So we can put a else to skip all the following code

/// Check if we can go jump one block vertically (right side)
if (ds_grid_get(ds_grid_pathfinding,_x+1,_y)==-2 && ds_grid_get(ds_grid_pathfinding,_x+1,_y-1)==-1)
            {
            ds_grid_set(ds_grid_pathfinding,_x+1,_y-1,i);
            ds_list_add (point_list, _x + 1);
            ds_list_add (point_list, _y-1);
            }
else {  /// If the ennemy can go jump one block horizontally, the others movement will be impossible. So we can put a else to skip all the following code

/// Check if the enemy can do a diagonal jump (Big Jump). (Right side);
if ds_grid_get(ds_grid_pathfinding,_x+1,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x+2,_y)==-2 && ds_grid_get(ds_grid_pathfinding,_x+2,_y-1)==-1
        {
        ds_grid_set(ds_grid_pathfinding,_x+2,_y-1,i);
        ds_list_add (point_list, _x + 2);
        ds_list_add (point_list, _y-1);
        }

///Check if the enemy can jump horizontally (jump over a void). (Right side)
if ds_grid_get(ds_grid_pathfinding,_x+1,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x+2,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x+2,_y+1)==-2
        {
        ds_grid_set(ds_grid_pathfinding,_x+2,_y,i);
        ds_list_add (point_list, _x + 2);
        ds_list_add (point_list, _y);
        }

/// Check if the enemy can fall (Right side).
if ds_grid_get(ds_grid_pathfinding,_x+1,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x+1,_y+1)==-1
            {
                    {
                    do
                       {
                       n=n+1 ;
                       a = ds_grid_get(ds_grid_pathfinding,_x+1,_y+n);
                       }
                    until (a==-2) ||  (_y+n == ds_grid_height(ds_grid_pathfinding)) }
                    
        if ds_grid_get(ds_grid_pathfinding,_x+1,_y+n-1)==-1 && ds_grid_get(ds_grid_pathfinding,_x+1,_y+n)== -2
            {
            ds_grid_set(ds_grid_pathfinding,_x+1,_y+n-1,i);
            ds_list_add (point_list, _x + 1);
            ds_list_add (point_list, _y+n-1);
            }
        }
    }
}


n=1 ; /// Re-initialize variable for the Fall (left side)

/// Check if the enemy can go to the left
if ds_grid_get(ds_grid_pathfinding,_x-1,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x-1,_y+1)==-2 {
ds_grid_set(ds_grid_pathfinding,_x-1,_y,i);
ds_list_add (point_list, _x -1);
ds_list_add (point_list, _y);
}
else{

/// Check if we can go jump one block vertically (left side)
if ds_grid_get(ds_grid_pathfinding,_x-1,_y)==-2 && ds_grid_get(ds_grid_pathfinding,_x-1,_y-1)==-1{
ds_grid_set(ds_grid_pathfinding,_x-1,_y-1,i);
ds_list_add (point_list, _x-1);
ds_list_add (point_list, _y-1);
}
else {

/// Check if the enemy can do a diagonal jump (Big Jump). (left side);
if ds_grid_get(ds_grid_pathfinding,_x-1,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x-2,_y)==-2 && ds_grid_get(ds_grid_pathfinding,_x-2,_y-1)==-1{
ds_grid_set(ds_grid_pathfinding,_x-2,_y-1,i);
ds_list_add (point_list, _x-2);
ds_list_add (point_list, _y-1);
}

///Check if the enemy can jump horizontally (over a void). (left side)
if ds_grid_get(ds_grid_pathfinding,_x-1,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x-2,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x-2,_y+1)==-2{
ds_grid_set(ds_grid_pathfinding,_x-2,_y,i);
ds_list_add (point_list, _x-2);
ds_list_add (point_list, _y);
}

/// Check if the enemy can fall (left side).
if ds_grid_get(ds_grid_pathfinding,_x-1,_y)==-1 && ds_grid_get(ds_grid_pathfinding,_x-1,_y+1)==-1
            {
                {
                do
                   {
                   n=n+1 ;
                   a = ds_grid_get(ds_grid_pathfinding,_x-1,_y+n);
                   }
                until (a=-2) || (_y+n==ds_grid_height(ds_grid_pathfinding))}   
                    if ds_grid_get(ds_grid_pathfinding,_x-1,_y+n-1)==-1 && ds_grid_get(ds_grid_pathfinding,_x-1,_y+n)== -2
                    {
                    ds_grid_set(ds_grid_pathfinding,_x-1,_y+n-1,i);
                    ds_list_add (point_list, _x-1);
                    ds_list_add (point_list, _y+n-1);
                    }
            }
        }
    }
}
/// Delete all the previous points
for (var k=0; k< size_list; k+=1)
    {
    ds_list_delete (point_list, 0);
    }
}