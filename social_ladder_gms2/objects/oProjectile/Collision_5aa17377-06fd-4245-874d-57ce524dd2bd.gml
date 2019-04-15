if other.state == "death" || other.state == "dead"
{
	exit;
}


create_hitbox(x, y, creator, sDistance_projectile_mask, 3, 2, 5, -image_xscale);
if oPlayer.state == "knockback"
{
set_state_sprite(sDistance_projectile_hitspark,1,0);
spd = 0;
instance_change(oProjectile_hitspark,true);
}
