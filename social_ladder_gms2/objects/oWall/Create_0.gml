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
		//tille size
		width = other.width;
		height = other.height;
		show = other.show;
	}	
}

