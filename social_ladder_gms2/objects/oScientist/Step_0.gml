switch (state)
{
	case "walk" :
		set_state_sprite(sScientist_walk,0.2,0);
		x -= walk_speed;
		if x <= 643
		{
			state = "wait";
			oCutscenes.state = "text1";
		}
	break;
	case "wait" :
		set_state_sprite(sScientist_idle,0.2,0);
	break;
	case "wait2" :
		set_state_sprite(sScientist_idle2,0.2,0);
	break;
	case "transformation" :
		set_state_sprite(sScientist_tranformation,0.4,0);
		if animation_end()
		{
			state = "wait3";
		}
	break;
	case "wait3" :
		set_state_sprite(sSlug_idle,0.2,0);
		oCutscenes.toggle = true;
	break;
}