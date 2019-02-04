//set up camera
cam = view_camera[0];
follow = noone;

view_w = global.ideal_width / 4;
view_h = global.ideal_height / 4;

view_w_half =0;
view_h_half =0;

xTo = xstart;
yTo = ystart;

//Set up Screenshake
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;