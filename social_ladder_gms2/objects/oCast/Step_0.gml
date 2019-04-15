x += spd * image_xscale;

if animation_end()
{
	image_index = 1;
	image_speed = 0.5
	sprite_index = sPlayer_projectile_loop;
}

var view_width = camera_get_view_width(view_camera[0]);
if distance_to_object(oPlayer) > view_width + 50
{
	instance_destroy();
}