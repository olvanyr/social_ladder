
//keyboard_set_map(ord("Q"), vk_left);
//keyboard_set_map(ord("D"), vk_right);
//keyboard_set_map(ord("Z"), vk_up);
//keyboard_set_map(ord("S"), vk_down);

get_input();


//track if the gamepad or the keyboard is curently used
if gamepad_is_connected(0)
{
	for (var i = 0; i < 20; i++)
	{
		if gamepad_button_check_pressed(0,i)
		{
			global.control = "gamepad";
		}
	}
	
}


if keyboard_check_pressed(vk_anykey)
{
	global.control = "keyboard";
}


//show_debug_message("control : " + string(global.control));