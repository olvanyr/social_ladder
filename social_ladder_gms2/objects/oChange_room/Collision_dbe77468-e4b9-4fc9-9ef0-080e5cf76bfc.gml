if new_music == noone
{
	var splits = split_string(room_get_name(next_room),"_");
	zone = splits[0];
	
	if object_exists(asset_get_index("m" + string(zone)))
	{
		new_music = asset_get_index("m" + string(zone));
	}else new_music = s1;
}


if oInput.use
{
	oPlayer.state = "wait";
	oPlayer.vsp = 0;
	oPlayer.vsp_fraction = 0;
	if !layer_exists("Effects")
	{
		layer_create(depth_layer.effects,"Effects");
	}
	with instance_create_layer(0,0,"Effects", oTransition)
	{
		next_room = other.next_room;
		x_next = other.x_next;
		y_next = other.y_next;
		global.new_music = other.new_music;
	}
}

/*
if oPlayer.x == x
{
	oPlayer.state = "wait";
	with instance_create_layer(0,0,"Effects", oTransition)
	{
		next_room = other.next_room;
		x_next = other.x_next;
		y_next = other.y_next;
		global.new_music = other.new_music;
	}
}

