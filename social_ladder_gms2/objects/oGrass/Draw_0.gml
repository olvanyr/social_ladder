if instance_exists(oPlayer)
{
	if abs(oPlayer.x - x) < global.ideal_width	draw_sprite_skew_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, xskew, 0)
}