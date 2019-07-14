
if other.state == "death" || other.state == "dead"
{
	exit;
}


other.chase_timer = other.chase_time_remaning * 3;

create_hitbox(x, y, creator, sPlayer_projectile, damage, 2, knockback, image_xscale);
set_state_sprite(sPlayer_projectile_hitspark,1,0);
spd = 0;
instance_change(oHitspark,true);


