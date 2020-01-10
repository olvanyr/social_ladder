if !layer_exists("Effects")
{
	layer_create(depth_layer.effects,"Effects");
}
set_layer_depth("Effects",depth_layer.effects);


if !layer_exists("Door")
{
	layer_create(depth_layer.door,"Door");
}
set_layer_depth("Door",depth_layer.door);
layer = layer_get_id("Door");

player_xp = 0;
xp_count = 0;
image_speed = 0;

visual_factor = 5; //nomber of particle generated for one xp

if is_door_open(id)
{
	with instance_create_layer(x,y,"Door",oDoor)
	{
		door_sprite = sDoor_boss;
		door_status = "open";
		anim_speed = 0.1;
		animation_frame = sprite_get_number(door_sprite)-1;
		mask_index = door_sprite;
		
	}
	instance_destroy(self);
	
}