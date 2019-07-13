//normal camera view is global.ideal_width / 4;

var zoom_value;

if ds_map_exists(room_status, room_get_name(room))
{
	zoom_value = ds_map_find_value(room_status,(room_get_name(room)));
}else zoom_value = 4;

view_w = global.ideal_width / zoom_value;
view_h = global.ideal_height / zoom_value;

if instance_exists(oCamera)
{	
	camera_view_w = oCamera.view_w;
	camera_view_h = oCamera.view_h;
}

purcent = 0;