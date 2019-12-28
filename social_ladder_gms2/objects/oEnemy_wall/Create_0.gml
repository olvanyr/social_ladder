if !layer_exists("Enemy_walls")
{
	layer_create(depth_layer.enemy_walls,"Enemy_walls");
}else 
{
	layer_depth(layer_get_id("Enemy_walls"),depth_layer.enemy_walls)
}

layer = layer_get_id("Enemy_walls");
