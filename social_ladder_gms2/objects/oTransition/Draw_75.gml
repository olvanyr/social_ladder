if instance_exists(oPlayer)
{
	
	oPlayer.vsp = 0;
	oPlayer.vsp_fraction = 0;
	draw_set_alpha(timer);
	draw_rectangle_color(0,0,window_get_width(),window_get_height(),c,c,c,c,false);

	timer += 0.05;
	
	if timer >= 1
	{
		room_goto(next_room);
		oPlayer.x = x_next;
		oPlayer.y = y_next;
		oCamera.x = x_next;
		oCamera.y = y_next;
		oCamera.follow = oPlayer;
		
		if oPlayer.state == "death" || oPlayer.state = "suicide"
		{
			oPlayer.state = "wake_up"
		}else oPlayer.state = "move";
		oPlayer.hp = hp;	
	}
	draw_set_alpha(1);
	
}