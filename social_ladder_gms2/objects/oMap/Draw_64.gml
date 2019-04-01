
if pause exit;

//draw map page

//draw background

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
		draw_sprite(sprite,0,0,0); 
	}
}

//draw setting page