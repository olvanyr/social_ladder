
//update camera
var view_w_half = view_w * 0.5;
var view_h_half = view_h * 0.5;

if instance_exists(oInput)
{
	y_buffer = normal_y_buffer;
	if oInput.up 
	{
		y_buffer += 30
	}	
	if oInput.down 
	{
		y_buffer -= 30
	}
	
	if !oInput.up && !oInput.down y_buffer = normal_y_buffer;
}
//update destination
if (instance_exists(follow))
{
	var x_buffer = (cam_shift * follow.image_xscale);
	xTo = follow.x + x_buffer;
	yTo = follow.y - y_buffer;
	
	// if I whant the camera to be fix
	if (follow).object_index == noone
	{
		x = xTo;
		y = yTo;
	}
}

//update object position
x += (xTo - x ) / smooth_value;
y += (yTo - y) / smooth_value;


//Keep camera centre inside room
x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);



//screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0,shake_remain -((1/shake_length)*shake_magnitude));

//update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
camera_set_view_size(view_camera[0],view_w,view_h);
camera_set_view_border(view_camera[0],view_w,view_h);