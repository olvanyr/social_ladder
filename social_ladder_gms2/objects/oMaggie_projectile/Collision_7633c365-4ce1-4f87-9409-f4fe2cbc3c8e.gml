if other.state == "death" || other.state == "dead" || oPlayer.state == "roll"
{
	exit;
}


create_hitbox(x, y, creator, sMaggie_projectile_mask, 3, 2, 5, -image_xscale);

if oPlayer.state == "knockback"
{
	set_state_sprite(sPlayer_projectile_hitspark,1,0);
	spd = 0;
	instance_change(oHitspark,true)
}
