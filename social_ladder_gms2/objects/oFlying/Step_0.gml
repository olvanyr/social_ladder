switch state 
{
	case "idle" : 
		set_state_sprite(sFlying_move,0.3,0);
		state_idle();
	break;
	case "chase" : 
		if !instance_exists(oPlayer) exit;
		
		if x - oPlayer.x > 0 
		{
			image_xscale = 1;
		}else image_xscale = -1;
		var dir = point_direction(x, y, oPlayer.x, oPlayer.y - ybuffer);
		var acceleration = 0.25;
		motion_add(dir, acceleration);
		var max_speed = 1;
		if (speed > max_speed) speed = max_speed; 
	break;
	case "death":
		death_state(sFlying_die);
	break;
	case "dead":
		dead_state(sFlying_die);
	break;
	case "knockback":
		knockback_state(sFlying_move, "stunt");
		alarm[1] = stunt_time;
	break;
}