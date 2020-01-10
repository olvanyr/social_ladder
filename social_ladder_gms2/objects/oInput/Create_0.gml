//move
right = keyboard_check(global.key_right);
left = keyboard_check(global.key_left);
down = keyboard_check(global.key_down);
//up = keyboard_check(vk_up);
//cam
up_cam = 0;
down_cam = 0;
right_cam = 0;
left_cam = 0;
//action
roll = keyboard_check_pressed(vk_space);
attack = keyboard_check_pressed(global.key_attack);
use = keyboard_check_pressed(global.key_use);
use_healthpack = keyboard_check_pressed(global.key_use_healthpack);

suicide_left = keyboard_check(global.key_use);
suicide_right = keyboard_check(global.key_use_healthpack);

cast = keyboard_check_pressed(global.key_cast);
//jump
jump = keyboard_check_pressed(global.key_up);
jump_released = keyboard_check_released(global.key_up);
//menu
enter = keyboard_check_pressed(vk_enter);
back = keyboard_check_pressed(vk_escape);
menu_right = keyboard_check_pressed(global.key_right);
menu_left = keyboard_check_pressed(global.key_left);
menu_down = keyboard_check_pressed(global.key_down);
menu_up = keyboard_check_pressed(global.key_up);
erase = keyboard_check_pressed(global.key_attack);
start = keyboard_check_pressed(ord("P"));
next_tab = keyboard_check(ord("E"));
previous_tab = keyboard_check(ord("A"));


toggle = false;
toggle2 = false;