if(instance_exists(oPlayer))
{	
	if (point_in_circle(oPlayer.x, oPlayer.y, x, y, radius)) && (!instance_exists(oText))
	{
	
		with (instance_create_layer(x, y, layer,oText))
	
		{
			text = other.text;
			length = string_length(text);
			radius = other.radius;
			xpos = other.x;
			ypos = other.y - 50;
		}	
	
		
		with (oCamera)
		{
			follow = other.id;
		}
		
	}
}