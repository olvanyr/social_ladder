

if !instance_exists(oCamera)
{
	cam = instance_create_layer(x,y,"Instances", oCamera)
}
if !instance_exists(oInput)
{
	input = instance_create_layer(x,y,"Instances", oInput)
}
view_height = camera_get_view_height(cam);
view_width = camera_get_view_width(cam);

state = "start";


c = c_black;
alpha = 1;
fadeout = 0;

toggle = false; //use to make the Skala sprite draw 
a = 0; //use to make the Skala alpha


c_text = c_black;
font =fDial;
ybuffer = 80;
line = "";
line_part = "";

text_buffer = 20;

letters_count = 0;
//letter_speed = 0.5;
letter_speed = 0.5;
//time_bettween_line = 150;
time_bettween_line = 20;
next_line = 0;

timer = 0;

lines[0] = "I here to free you";
lines[1] = "The outside world is very hostile";
lines[2] = "But it is yours now";
lines[3] = "you will have to kill\nall of this creature";
