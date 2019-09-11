


letters += spd;
text_current = string_copy(text,1,floor(letters));
draw_set_font(fText);
if (h == 0) h = string_height(text);
w = string_width(text_current);

// Destroy when done

if instance_exists(oPlayer)
{
	if(letters >= length) && !point_in_circle(oPlayer.x,oPlayer.y,other.x,other.y, radius)
	{
		instance_destroy();
		with(oCamera) follow = oPlayer;
	}
}