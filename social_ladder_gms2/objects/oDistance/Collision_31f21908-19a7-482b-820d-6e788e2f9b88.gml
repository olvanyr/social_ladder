
if state == "death" || state == "roll" || state == "dead" || state == "wait" exit;

create_hitbox(x, y, self, mask, 3, 2, 2, image_xscale);
			
if oPlayer.state != "roll"
{
	knockback_speed = sign(x - oPlayer.x) * 5;
	if state != "attack"
	{
		state = "knockback";
	}
}else state = "chase";