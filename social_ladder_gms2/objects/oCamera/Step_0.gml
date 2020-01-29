

//update camera
var view_w_half = view_w * 0.5;
var view_h_half = view_h * 0.5;

if instance_exists(oInput) && instance_exists(oPlayer)
{
	y_buffer = normal_y_buffer;
	if oInput.up_cam 
	{
		y_buffer += 60
	}	
	if oInput.down_cam 
	{
		y_buffer -= 60
	}
	
	if !oInput.up_cam && !oInput.down_cam y_buffer = normal_y_buffer;
	
	x_buffer = normal_x_buffer;
	if oInput.right_cam 
	{
		x_buffer += 60
	}	
	if oInput.left_cam 
	{
		x_buffer -= 60
	}
	
	if !oInput.left_cam && !oInput.right_cam x_buffer = normal_x_buffer;
}
//update destination
if (instance_exists(follow))
{
	x_buffer += (cam_shift * follow.image_xscale);
	xTo = follow.x + x_buffer;
	yTo = follow.y - y_buffer;
	
	// if I whant the camera to be fix
	if (follow).object_index == noone
	{
		x = xTo;
		y = yTo;
	}
	
	x = clamp(x,follow.x - 100 , follow.x + 100);
	y = clamp(y,follow.y - 80 , follow.y + 80);
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

if instance_exists(oFix)
{
	follow = oFix;
}else if follow == oFix follow = oPlayer;




//paralax
if instance_exists(oPlayer)
{
	if last_room != room
	{
			last_room = room;
			paralax_y = oPlayer.y - 150;
	}
	
	
	 gap_max = 45;
	 gap_min = 5;
	 
	 gap = lerp(gap_min, gap_max,(y / room_height));

	if(layer_exists("Paralax_front"))
	{
			layer_x("Paralax_front",x * 0.2);
			//layer_y("Paralax_front",paralax_y - (y * 0.9));
			//layer_y("Paralax_front",paralax_y + (y * 0.1));
			//layer_y("Paralax_front",y - 10 -(y*0.2));
			layer_y("Paralax_front",y - gap);
	}
	if(layer_exists("Paralax_back"))
	{
			layer_x("Paralax_back",x * 0.05);
			//layer_y("Paralax_front",paralax_y - (y * 0.9));
			//layer_y("Paralax_back",paralax_y + ((y * 0.1) - 50));
			//layer_y("Paralax_back",y - 35 -(y*0.1));
			layer_y("Paralax_back",y - gap*2);
	}
}