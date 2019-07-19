
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
		create_hitbox(x, y, creator, sDeer_ondulation_mask, 3, 100, 10, -image_xscale);
	}
	for(var i = animation_x; i < room_width - 1; i += sprite_width)
	{
		draw_sprite(sDeer_ondulation_loop_red,0,i + 1,y);
	}

	for(var i = animation_x; i > 0; i -= sprite_width)
	{
		draw_sprite(sDeer_ondulation_loop_red,0,i + 1,y);
	}
}


if timer > attack_time * 2
{
	instance_destroy();
}