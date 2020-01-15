///@description ChangeWindowMode
///@arg value

switch(argument0)
{
	case 0: window_set_fullscreen(true); global.fullscreen = false; break;
	case 1: 
	{
		window_set_fullscreen(false); 
		global.fullscreen = true; 
		window_set_size(global.ideal_width,global.ideal_height);
	}	
	break;
}