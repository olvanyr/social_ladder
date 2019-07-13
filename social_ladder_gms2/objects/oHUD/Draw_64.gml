var cam = view_camera[0];
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);
display_set_gui_size(global.ideal_width/4,global.ideal_height/4);

draw_sprite_outline(sHUD, 0, x_buffer, y_buffer,0.5,c_dkgray);


if instance_exists(oPlayer)
{
	var c = make_color_rgb(158,11,15);
	if oPlayer.hp != 0
	{
		
		if instance_exists(oPlayer)
		{
			draw_hp = lerp(draw_hp, oPlayer.hp, 0.2);
			draw_max_hp = oPlayer.max_hp;
		}else
		{
			draw_hp = lerp(draw_hp, 0,0.2);
		}
		var hp_percent = draw_hp / draw_max_hp;

		draw_rectangle_color(hp_x,hp_y,hp_x + hp_width * hp_percent,hp_y + hp_height,c,c,c,c,0);
	}

	for (var i = 0; i < oPlayer.healthpack; i ++)
	{
		draw_rectangle_color(x_pack + (i * (inter_pack + pack_width)), hp_y, x_pack + pack_width + (i * (inter_pack + pack_width)), hp_y + hp_height,c,c,c,c,0);
	}
}
draw_sprite_ext(sHUD,0,x_buffer,y_buffer,1,1,0,image_blend,image_alpha);


