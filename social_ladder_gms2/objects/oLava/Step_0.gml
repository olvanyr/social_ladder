if place_meeting(x,y,oPlayer) && timer >= 0
{
	create_hitbox(x, y, self, sprite_index, 0, 2, 3, 1);
}

timer ++;

if timer >= 30 timer = 0;