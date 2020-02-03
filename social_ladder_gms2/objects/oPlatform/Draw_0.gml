draw_sprite(sPlatform, 0, x,y);

if instance_exists(oPlayer)
{
	if place_meeting(x,y - 1, oPlayer)
	{
		timer --;
	}else 
	{
		timer = max_timer;
		if instance_exists(pop_up)
		{
			instance_destroy(pop_up);
		}
	}
}

timer = manage_timer(timer);

if timer <= 0
{
	if !instance_exists(pop_up) && !instance_exists(oPop_up)
	{
		pop_up = instance_create_layer(x,y,"Effects",oPop_up);
		with pop_up
		{
			//sprite_animation(sDown,0,0.05,x,y);
			sprite = sDown;
			letter = global.key_jump;
			anim_speed = 0.05;
			_x = oPlayer.x + 5;
			_y = oPlayer.y - 55;
			letter_x = oPlayer.x - 5;
			letter_y = oPlayer.y - 55;
		}
	}
	
}

if global.zone == "rDz"
{
	draw_sprite_ext(sPlatform_red,0,x,y,image_xscale,image_yscale,0,c_white,1);
}else
{
	draw_sprite_ext(sPlatform_black,0,x,y,image_xscale,image_yscale,0,0,1);
}

//show_debug_message("global.zone : " + string(global.zone));