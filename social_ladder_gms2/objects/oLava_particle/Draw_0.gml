var c = c_black;

draw_rectangle_color(x,y,x+1,y+1,c,c,c,c,false);

timer ++;

if timer > lifespawn 
{
	image_alpha -= 0.1;
	if image_alpha <= 0 instance_destroy();
}