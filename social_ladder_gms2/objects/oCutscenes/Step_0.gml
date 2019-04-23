
switch (state)
{
	case "start" :
		fadeout = 0;
		cam.xTo += 1;
		if alpha <= 0
		{
			state = "wait";
		}
	break;
	case "text1" :
		lines[0] = "I'm here to free you";
		lines[1] = "The outside world is very hostile";
		lines[2] = "But it is yours now";
		lines[3] = "you will have to kill\nall of this creature";
		
		text_cutscenes("free");
	break;
	case "free" :
		fadeout = 0;
		alpha += 0.01
		if alpha >= 1
		{
			state = "free2";
			layer_set_visible("Lab",false);
			layer_set_visible("Lab_destroy",true);
			layer_set_visible("Fake",true);
			oScientist.state = "wait2";
		}
	break;
	case "free2" :
		fadeout = 0;
		if alpha <= 0
		{
			state = "text2";
		}
	break;
	case "text2" :
		lines[0] = "text 2 ligne 1";
		lines[1] = "text 2 ligne 2";
		lines[2] = "text 2 ligne 3";
		lines[3] = "ligne 4";
		text_cutscenes("transformation");
	break;
	case "transformation" :
		oScientist.state = "transformation";
		state = "wait";
	break;
	case "wait" :
		if a == 2 && input.enter
		{
			global.new_music = mRoom1;
			room_goto(rLab);
		}
	break;
}

if !fadeout 
{
	alpha = max(alpha - 0.0025, 0);
}else alpha = min(alpha,1);

