
var cam = view_camera[0];
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);
display_set_gui_size(view_w,view_h);

if !instance_exists(oPlayer) exit;
draw_hp = oPlayer.hp;

//HUD 
x_buffer = 5;
y_buffer = 5;

hp_x = x_buffer + (3); 
hp_y = y_buffer + (2); 
hp_width = 94;
max_hp_width = hp_width;
hp_height = 4;

x_pack = hp_x + max_hp_width + (12);
inter_pack = 7;
pack_width = 5;

//temporary fullscreen togle
toggle = false;