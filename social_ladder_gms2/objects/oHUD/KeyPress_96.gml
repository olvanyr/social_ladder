
if keyboard_check_pressed(vk_lshift)
{
	if toggle 
	{
		toggle = false;
	}else toggle = true;

	window_set_fullscreen(toggle);
}