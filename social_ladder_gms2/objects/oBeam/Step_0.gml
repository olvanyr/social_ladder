
if animation_hit_frame(6)
{
	create_hitbox(x, y, oHorn, mask, knockback, 2, damage, image_xscale);
}

if animation_end()
{
	instance_destroy();
}