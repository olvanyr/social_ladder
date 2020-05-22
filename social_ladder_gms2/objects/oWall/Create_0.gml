sprite_x = x;
sprite_y = y;
sprite_image_angle = 0;
tile_sprite_index = sWall;

if !layer_exists("Walls")
{
	layer_create(depth_layer.walls,"Walls");
}

layer = layer_get_id("Walls");


//tille size
width = 32;
height = width;

//check if coord is not on the grid
if x mod width != 0 || y mod height != 0
{
	var splits = split_string(string(room_get_name(room)),"_");
	zone = splits[0];
	sprite_index = asset_get_index("sTille_" + string(zone) + "_free");
	auto_tile_random_sprite();
	
}else 
{
	if !layer_exists("Tiles")
	{
		layer_create(depth_layer.tiles,"Tiles");
	}

	with instance_create_layer(x,y,"Tiles",oTile)
	{
		creator = other.id;
		//tille size
		width = other.width;
		height = other.height;
		show = other.show;
	}
}

//collision
right =			place_meeting(x+1,y,oWall);
left =			place_meeting(x-1,y,oWall);
top =			place_meeting(x,y-1,oWall);
bottom =		place_meeting(x,y+1,oWall);

