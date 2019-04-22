switch (state)
{
	case "start" :
		alpha -= 0.0025;
		cam.xTo += 1;
		if alpha <= 0
		{
			state = "wait";
		}
	break;
	case "wait" :
	break;
}