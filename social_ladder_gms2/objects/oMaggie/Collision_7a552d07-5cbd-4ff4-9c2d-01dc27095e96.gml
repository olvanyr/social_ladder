
if state == "death" || state == "roll" || state == "dead" exit;

if self.object_index == oScratcher
{
	if state == "charge"
	{
		create_hitbox(x, y, self, mask, knockback_charge, 2, charge_damage, image_xscale);
	}else create_hitbox(x, y, self, mask, 3, 2, contact_damage, image_xscale);
}else create_hitbox(x, y, self, mask, 3, 2, contact_damage, image_xscale);

if self.object_index != oMaggie
{
	
	if oPlayer.state != "roll"
	{
		knockback_speed = sign(x - oPlayer.x) * 5;
		state = "knockback";
	}else state = "chase";
}