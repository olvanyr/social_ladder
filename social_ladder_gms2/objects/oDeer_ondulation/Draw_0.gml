
animation_x += 0.3;

timer ++;

for(var i = animation_x; i < room_width - 1; i += sprite_width)
{
	draw_sprite(sDeer_ondulation_loop,0,i,y);
}

for(var i = animation_x; i > 0; i -= sprite_width)
{
	draw_sprite(sDeer_ondulation_loop,0,i,y);
}


if timer > attack_time
{
	if once
	{
		once = false;
		create_hitbox(x, y, creator, sDeer_ondulation_mask, 3, 20, 10, -image_xscale);
	}
	for(var i = animation_x; i < room_width - 1; i += sprite_width)
	{
		draw_sprite_ext(sDeer_ondulation_loop_red,0,i + 1,y,1,1,0,c_white,alpha);
	}

	for(var i = animation_x; i > 0; i -= sprite_width)
	{
		draw_sprite_ext(sDeer_ondulation_loop_red,0,i + 1,y,1,1,0,c_white,alpha);
	}
}


if timer > attack_time * 1.5
{
	alpha -= 0.05;
}
if alpha <= 0
{
	instance_destroy();
	oDeer.state = "idle";
}