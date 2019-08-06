if other.state == "death" || other.state == "dead" || oPlayer.state == "roll"
{
	exit;
}


create_hitbox(x, y, creator, sSkeleton_projectile_mask, 3, 2, 5, -image_xscale);

if oPlayer.state == "knockback"
{
	spd = 0;
	instance_change(oHitspark,true)
	set_state_sprite(sSkeleton_projectile_hispark,1,0);
}
