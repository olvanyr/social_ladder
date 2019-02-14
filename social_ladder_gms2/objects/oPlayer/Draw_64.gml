///@description draw the HUD
/*draw_rectangle_color(x_health_buffer, y_health_buffer, x_health_buffer + health_bar_width, y_health_buffer + health_bar_height , c_red, c_red ,c_red ,c_red ,false);

for (var i = 0; i < healthpack; i ++)
{
	draw_rectangle_color(x_healthpack_buffer + (i * (inter_healthpack_buffer + healthpack_width)), y_health_buffer, x_healthpack_buffer + healthpack_width + (i * (inter_healthpack_buffer+ healthpack_width)), y_health_buffer + health_bar_height, c_red, c_red ,c_red ,c_red ,false);
}

draw_sprite_ext(sHUD,0,x_buffer,y_buffer,3,3,0,image_blend,image_alpha);


