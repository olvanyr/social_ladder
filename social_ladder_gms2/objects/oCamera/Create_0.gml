//set up camera
cam = view_camera[0];
follow = noone;

view_w = global.ideal_width / 4;
view_h = global.ideal_height / 4;

xTo = xstart;
yTo = ystart;
cam_shift = 40;

smooth_value = 10;

normal_y_buffer = sprite_get_height(sPlayer_mask) - 20;
y_buffer = normal_y_buffer;
normal_x_buffer = 0;
x_buffer = normal_x_buffer;

//Set up Screenshake
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;