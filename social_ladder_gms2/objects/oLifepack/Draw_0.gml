draw_self();

if instance_exists(oPlayer)
{
	var dir = oPlayer.image_xscale;
	if collision_rectangle(x - (dir * 30),y - 30,x,y,oPlayer,false,false)
	{
		var _image_number = sprite_get_number(sUse);
		image_counter += 0.03;
		var sub_image = image_counter;
		if sub_image == _image_number 
		{
			_image_number = 0;
		}
		draw_sprite(sUse,image_counter,x,y);
	}
}