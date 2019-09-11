
if(instance_exists(oPlayer))
{	
	if (point_in_circle(oPlayer.x, oPlayer.y, x, y, radius) && once)
	{
		once = false;
		audio_play_sound(aSound_dialogue5,priority.normal,false);
		var cam = view_camera[0];
		var view_w = camera_get_view_width(cam);
		var view_h = camera_get_view_height(cam);
		with (instance_create_layer(x, y, layer,oText))
		{
			text = other.text;
			length = string_length(text);
			radius = other.radius;
			xpos = view_w / 2;
			ypos = 2 * (view_h / 3);
			creator = other;
		}	
		
		with (oCamera)
		{
			follow = other.id;
		}
		
	}
	if !point_in_circle(oPlayer.x, oPlayer.y, x, y, radius)
	{
		once = true;
	}
}