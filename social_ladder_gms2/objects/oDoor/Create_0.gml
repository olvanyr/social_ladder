if !layer_exists("Enemies")
{
	layer_create(depth_layer.enemies,"Enemies");
}

layer = layer_get_id("Enemies");



key = "door1";

boss = noone;

door_sprite = sDoor1

sprite_index = noone;

animation_frame =0;

door_status = "closed";

image_counter = 0;

if is_door_open(id)
{
	door_status = "open";
	animation_frame = sprite_get_number(door_sprite)-1;
}