if timer >= 0
{
	create_hitbox(oPlayer.x, oPlayer.y, self, sprite_index, 0, 2, 3, 1);
}

timer ++;

if timer >= 40 timer = 0;