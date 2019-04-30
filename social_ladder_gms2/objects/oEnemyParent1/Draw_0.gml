event_inherited();


if state == "death" || state == "dead" exit;
if alarm[0] > 0
{
	var height = sprite_height;
	var sprite_w = sprite_get_width(sEnemy_bar)
	var c = c_white;
	draw_rectangle_color(x - sprite_w/2, y - height, x - sprite_w/2 + (hp/max_hp) * sprite_w, y - (height-2),c,c,c,c,0);
	draw_sprite(sEnemy_bar, 0, x - sprite_w/2, y - height);
}