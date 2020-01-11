///@description check the input

//move
right = keyboard_check(global.key_right);
left = keyboard_check(global.key_left);
down = keyboard_check(global.key_down);
up = keyboard_check(global.key_up);
//cam
up_cam = keyboard_check(vk_numpad8);
down_cam = keyboard_check(vk_numpad2);
right_cam = keyboard_check(vk_numpad6);
left_cam = keyboard_check(vk_numpad4);
//action
roll = keyboard_check_pressed(global.key_slide);
attack = keyboard_check_pressed(global.key_attack);
use = keyboard_check_pressed(global.key_use);
use_healthpack = keyboard_check_pressed(global.key_use_healthpack);

suicide_left = keyboard_check(global.key_use);
suicide_right = keyboard_check(global.key_use_healthpack);

cast = keyboard_check_pressed(global.key_cast);
//jump
jump = keyboard_check_pressed(global.key_up);
if keyboard_check_pressed(global.key_jump) jump = 1;
jump_released = keyboard_check_released(global.key_up);
if keyboard_check_released(global.key_jump) jump_released = 1;

//menu
enter = keyboard_check_pressed(vk_enter);
back = keyboard_check_pressed(vk_escape);
menu_right = keyboard_check_pressed(global.key_right);
menu_left = keyboard_check_pressed(global.key_left);
menu_down = keyboard_check_pressed(global.key_down);
menu_up = keyboard_check_pressed(global.key_up);
erase = keyboard_check_pressed(global.key_attack);
start = keyboard_check_pressed(global.key_pause);
next_tab = keyboard_check_pressed(ord("E"));
previous_tab = keyboard_check_pressed(ord("A"));

//control hard code
if keyboard_check(vk_right) right = 1;
if keyboard_check(vk_left) left = 1;
if keyboard_check(vk_down) down = 1;
if keyboard_check_pressed(vk_up) up = 1;
if keyboard_check_pressed(vk_up) jump = 1;
//menu hard code
if keyboard_check_pressed(vk_right) menu_right = 1;
if keyboard_check_pressed(vk_left) menu_left = 1;
if keyboard_check_pressed(vk_down) menu_down = 1;
if keyboard_check_pressed(vk_up) menu_up = 1;

//gamepad
if (abs(gamepad_axis_value(0,gp_axislv)) > 0.5)
{
	if (max(gamepad_axis_value(0,gp_axislv),0) > 0.7) down = 1;
		
	else down = max(gamepad_axis_value(0, gp_axislv),0);
	
	if (abs(min(gamepad_axis_value(0,gp_axislv),0)) > 0.7)	up = 1;
		
	else up = abs(min(gamepad_axis_value(0,gp_axislv),0));
}
if (abs(gamepad_axis_value(0,gp_axislh)) > 0.1)
{
	if (abs(min(gamepad_axis_value(0,gp_axislh),0)) > 0.7)	left = 1;
		
	else left = abs(min(gamepad_axis_value(0,gp_axislh),0));
	
	if (max(gamepad_axis_value(0,gp_axislh),0) > 0.7) right = 1;
		
	else right = max(gamepad_axis_value(0, gp_axislh),0);
}

//cam

if (abs(gamepad_axis_value(0,gp_axisrv)) > 0.5)
{
	if (max(gamepad_axis_value(0,gp_axisrv),0) > 0.7) down_cam = 1;
		
	else down_cam = max(gamepad_axis_value(0, gp_axisrv),0);
	
	if (abs(min(gamepad_axis_value(0,gp_axisrv),0)) > 0.7)	up_cam = 1;
		
	else up_cam = abs(min(gamepad_axis_value(0,gp_axisrv),0));
}
if (abs(gamepad_axis_value(0,gp_axisrh)) > 0.1)
{
	if (abs(min(gamepad_axis_value(0,gp_axisrh),0)) > 0.7)	left_cam = 1;
		
	else left_cam = abs(min(gamepad_axis_value(0,gp_axisrh),0));
	
	if (max(gamepad_axis_value(0,gp_axisrh),0) > 0.7) right_cam = 1;
		
	else right_cam = max(gamepad_axis_value(0, gp_axisrh),0);
}


//action
if gamepad_button_check_pressed(0,gp_face2) roll = 1;
if gamepad_button_check_pressed(0,gp_face3) attack = 1;
if gamepad_button_check_pressed(0,gp_shoulderl) use = 1;
if gamepad_button_check_pressed(0,gp_shoulderr) use_healthpack = 1;

if gamepad_button_check(0,gp_shoulderl) suicide_left = 1;
if gamepad_button_check(0,gp_shoulderr) suicide_right = 1;


if gamepad_button_check_pressed(0,gp_face4) cast = 1;
//jump
if gamepad_button_check_pressed(0,gp_face1) jump = 1;
if gamepad_button_check_released(0,gp_face1) jump_released = 1;
//menu
if gamepad_button_check_pressed(0,gp_face1) enter = 1;
if gamepad_button_check_pressed(0,gp_face2) back = 1;
if gamepad_button_check_pressed(0,gp_face3) erase = 1;
if gamepad_button_check_pressed(0,gp_padl) menu_left = 1;
if gamepad_button_check_pressed(0,gp_padr) menu_right = 1;
if gamepad_button_check_pressed(0,gp_padu) menu_up = 1;
if gamepad_button_check_pressed(0,gp_padd) menu_down = 1;
if gamepad_button_check_pressed(0,gp_start) start = 1;
if gamepad_button_check_pressed(0,gp_shoulderl) next_tab = 1;
if gamepad_button_check_pressed(0,gp_shoulderr) previous_tab = 1;



if (abs(gamepad_axis_value(0,gp_axislv)) > 0.5)
{
	if (max(gamepad_axis_value(0,gp_axislv),0) > 0.7) && !toggle
	{
		menu_down = 1;
		toggle = true;
	}

	
	if (abs(min(gamepad_axis_value(0,gp_axislv),0)) > 0.7) && !toggle
	{
		menu_up = 1;
		toggle = true;
	}
}else toggle = false;


if (abs(gamepad_axis_value(0,gp_axislh)) > 0.1)
{
	if (abs(min(gamepad_axis_value(0,gp_axislh),0)) > 0.7) && !toggle2
	{
		menu_left = 1;
		toggle2 = true;
	}
	if (max(gamepad_axis_value(0,gp_axislh),0) > 0.7)&& !toggle2
	{
		menu_right = 1;
		toggle2 = true;
	}
}else toggle2 = false;
