/// @description State = death if life = 0
if hp <= 0 && state != "death"
{
	state = "death";
	if other.hp > 0 other.hp = 0;
	save_enemies();
} 

//sav location here
//store the monster id
//store location into an array
// during the creat evet if the id is inside the sav array, then x = x position etc
//do I make a different save place for each room ? If y use a ds map maybe