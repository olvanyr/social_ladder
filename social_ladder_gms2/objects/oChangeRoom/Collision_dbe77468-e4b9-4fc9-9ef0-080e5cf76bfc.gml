if keyboard_check_pressed(ord("N"))
{
	with instance_create_layer(0,0,"Instances", oTransition)
	{
		next_room = other.next_room;
		x_next = other.x_next;
		y_next = other.y_next;
	}
}
