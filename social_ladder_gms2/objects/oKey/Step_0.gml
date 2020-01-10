


if picked
{
	if instance_exists(oPlayer)
	{
		x += (oPlayer.x - x) / 10;
		y += (oPlayer.y - 18 - y) / 10;
		image_angle += 6;
		instance_create_layer(x,y,layer,oGround_effect)
		if image_angle > 270 || image_alpha <= 0
		{
			audio_play_sound(aPickup,priority.normal,0);
			instance_destroy();
		}
		
		if image_angle > 70
		{
			image_alpha += -0.02;
		}
	}
}else y = ystart + sin(get_timer()/900000)*4;

//show_debug_message(global.key);