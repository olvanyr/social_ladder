
if state == "death" || state == "roll" || state == "dead" || state = "speak" ||state = "stun" exit;

if state = "attack_charge" ||state == "attack_charge_middle"
{
	create_hitbox(x, y, self, mask, 6, 2, contact_damage * 2, image_xscale);
}else create_hitbox(x, y, self, mask, 3, 2, contact_damage, image_xscale);