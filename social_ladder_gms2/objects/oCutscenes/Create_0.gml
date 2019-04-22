

if !instance_exists(oCamera)
{
	cam = instance_create_layer(x,y,"Instances", oCamera)
}
view_height = camera_get_view_height(view_camera[0]);
view_width = camera_get_view_width(view_camera[0]);

state = "start";


c = c_black;
alpha = 1;



line = "";
line_part = "";

letters_count = 0;
next_line = 0;

hold_key = 0;

lines[0] = "I here to free you";
lines[1] = "The outside world is very hostile";
lines[2] = "But it is yours now";
lines[3] = "you will have to kill\nall of this creature";