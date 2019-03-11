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