x += spd * image_xscale;
if animation_end()
{
	image_speed = 0;
	image_index = 1;
}

var view_width = camera_get_view_width(view_camera[0]);
if distance_to_object(oPlayer) > view_width + 50
{
	instance_destroy();
}