//move
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
down = keyboard_check(vk_down);
up = keyboard_check(vk_up);
//cam
up_cam = 0;
down_cam = 0;
//action
roll = keyboard_check_pressed(vk_space);
attack = keyboard_check_pressed(ord("V"));
use = keyboard_check_pressed(ord("N"));
use_healthpack = keyboard_check_pressed(ord("L"));
cast = keyboard_check_pressed(ord("I"));
//jump
jump = keyboard_check_pressed(vk_up);
jump_released = keyboard_check_released(vk_up);
//menu
enter = keyboard_check_pressed(vk_enter);
back = keyboard_check_pressed(vk_escape);
menu_right = keyboard_check(vk_right);
menu_left = keyboard_check(vk_left);
menu_down = keyboard_check(vk_down);
menu_up = keyboard_check(vk_up);
erase = keyboard_check(ord("V"));
start = keyboard_check(ord("P"));


toggle = false;
toggle2 = false;