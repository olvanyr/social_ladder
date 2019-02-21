room_list[room_last,0] = false;
for (var i = 0; i < room_last + 1; i++)
{
	
	room_list[i,1] = false;
}

room_list[room,0] = true;
save_room();