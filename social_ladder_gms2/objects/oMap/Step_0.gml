var death_count = 0;

with oEnemyParent 
{
	if state != "death"
	{
		death_count += 1;
	}
}

if room_list[room,0] = true
{
	// add the room to the map
	if death_count == 0
	{
		load_room();
		save_room();
		room_list[room,1] = true;
		// change the color of the sprite on the map
	}
}else 
{
	room_list[room,0] = true;
	load_room();
	save_room();
	
}
