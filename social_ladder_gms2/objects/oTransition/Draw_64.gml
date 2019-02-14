if instance_exists(oPlayer)
{
	draw_set_alpha(timer);
	draw_rectangle_color(0,0,window_get_width(),window_get_height(),c,c,c,c,false);

	timer += 0.05;
	
	if timer >= 1
	{
		room_goto(next_room);
		oPlayer.x = x_next;
		oPlayer.y = y_next;
		oPlayer.state = "move";
		oCamera.x = x_next;
		oCamera.y = y_next;
	}
	draw_set_alpha(1);
	
}