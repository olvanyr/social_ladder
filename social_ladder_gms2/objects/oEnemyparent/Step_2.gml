/// @description State = death if life = 0
if hp <= 0 && state != "death"
{
	state = "death";
	if other.hp > 0 other.hp = 0;
} 