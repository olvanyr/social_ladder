switch (state)
{
	case "walk" :
		set_state_sprite(sScientist_walk,0.2,0);
		x -= walk_speed;
		if x <= 643
		{
			state = "wait";
		}
	break;
	case "wait" :
	set_state_sprite(sScientist_Idle,0.2,0);
	break;
}