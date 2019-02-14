
if state == "death" exit;

create_hitbox(x, y, self, sRunner_mask, 3, 2, 1, image_xscale);
			
if oPlayer.state != "roll"
{
	knockback_speed = sign(x - oPlayer.x) * 5;
	state = "knockback";
}else state = "chase";