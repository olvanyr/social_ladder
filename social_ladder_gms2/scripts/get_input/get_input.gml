//keyboard
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
down = keyboard_check(vk_down);
up = keyboard_check(vk_up);
roll = keyboard_check_pressed(vk_space);
attack = keyboard_check_pressed(ord("V"));
jump = keyboard_check_pressed(vk_up);
jump_released = keyboard_check_released(vk_up);
use = keyboard_check_pressed(ord("N"));
use_healthpack = keyboard_check_pressed(ord("L"));
cast = keyboard_check_pressed(ord("I"));

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



if gamepad_button_check_pressed(0,gp_face1) jump = 1;
if gamepad_button_check_pressed(0,gp_face2) roll = 1;
if gamepad_button_check_pressed(0,gp_face3) attack = 1;
if gamepad_button_check_pressed(0,gp_shoulderr) use_healthpack = 1;
if gamepad_button_check_pressed(0,gp_shoulderl) use = 1;
if gamepad_button_check_released(0,gp_face1) jump_released = 1;
if gamepad_button_check_pressed(0,gp_face4) cast = 1;

