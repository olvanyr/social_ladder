var death_count = 0;

with oEnemyParent 
{
	if state != "dead"
	{
		death_count += 1;
	}
}



global.save[? room_get_name(room)] = death_count;


for ( var i = 0; i < room_last + 1; i++)
{
	var room_id = room_get_name(i);
	if ds_map_exists(global.save,room_id)
	{
		if global.save[? room_id] == 0
		{
			var sprite = string("sMap_") + string(room_id);
		}else
		{
			var sprite = string("sMap_red_") + string(room_id);
		}
		sprite = asset_get_index(sprite);
		
		var array_length = array_length_1d(room_array);
		room_array[array_length] = sprite; 
	}
}



