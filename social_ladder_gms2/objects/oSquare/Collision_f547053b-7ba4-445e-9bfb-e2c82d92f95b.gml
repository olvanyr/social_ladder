
if state == "death" || state == "roll" || state == "dead" || state = "speak" ||state = "stun" exit;

if form = "square"
{
	create_hitbox(x, y, self, mask, 10, 0, contact_damage, image_xscale);
}else create_hitbox(x, y, self, mask, 3, 2, contact_damage, image_xscale);
