if !layer_exists("Walls")
{
	layer_create(depth_layer.walls,"Walls");
}

layer = layer_get_id("Walls");

if room_get_name(room) == rLab
{
	layer = "Effects";
}