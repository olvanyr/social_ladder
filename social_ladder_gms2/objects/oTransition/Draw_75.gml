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
		oPlayer.grounded = true;
		oPlayer.alarm[0] = 0;
		with oPlayer
		{
			//move_contact_solid(270, -1);
			grounded = true;
		}
		
		oCamera.x = x_next + oCamera.x_buffer;
		oCamera.y = y_next - oCamera.y_buffer;

		oCamera.follow = oPlayer;
		
		if oPlayer.state == "death" || oPlayer.state = "suicide"
		{
			oPlayer.state = "wake_up"
		}else oPlayer.state = "move";
		oPlayer.hp = hp;	
	}
	draw_set_alpha(1);
	
}