show_debug_message("jelly state : " + string(state));

switch state 
{
	case "idle" : 
		set_state_sprite(idle,idle_spd,0);
		state = choose("chase","chase");
		
		trace = irandom(3);
		timer = 0;
		speed = 0;
		
		var dir = point_direction(x, y, oPlayer.x, oPlayer.y - ybuffer);
		image_angle = dir;
		
		if timer mod 100 == 0
		{
			player_x = oPlayer.x;
			player_y = oPlayer.y;		
		}		
		
			
		if hp <= (max_hp/4)*3 && once1
		{
				
			once1 = false;
				
			hp = (max_hp/4)*3;
				
			state = "speak";
				
			if instance_exists(oPlayer)
			{
				oPlayer.state = "wait";
			}				
			lines[0] = "text 1 ligne 1";
			lines[1] = "text 1 ligne 2";
			lines[2] = "text 1 ligne 3";
		}
			
		if hp <= (max_hp/4)*1 && once2
		{
				
			once2 = false;
				
			hp = (max_hp/4)*1;
				
			state = "speak";
				
			if instance_exists(oPlayer)
			{
				oPlayer.state = "wait";
			}				
			lines[0] = "text 2 ligne 1";
			lines[1] = "text 2 ligne 2";
			lines[2] = "text 2 ligne 3";
			lines[3] = "ligne 4";
		}
	break;
	case "chase" : 
	
		set_state_sprite(walk,walk_anim_spd,0);
		if !instance_exists(oPlayer) exit;
		
		if trace == 1
		{
			if timer mod 10 == 0
			{
				with instance_create_layer(x,y - 50,"Effects",oMaggie_projectile)
				{
					creator = other;
				}
			}
		}
		
		if timer <= chassing_time
		{
			if x - oPlayer.x > 0 
			{
				image_xscale = 1;
			}else image_xscale = -1;
			var dir = point_direction(x, y, player_x, player_y - ybuffer);
			var acceleration = 0.25;
			motion_add(dir, acceleration);
			var max_speed = 1;
			if (speed > max_speed) speed = max_speed; 
		}else state = "idle";	
	break;
	case "death":
		death_state(sFlying_die);
	break;
	case "dead":
		dead_state(sFlying_die);
		if instance_exists(oDoor)
		{
			oDoor.door_status = "open"
		}
	break;
	
	case "knockback":
		knockback_state(sFlying_move, "stunt");
		alarm[1] = stun_time;
	break;
	#region Charge
		case "charge":
			if timer <= charge_time
			{
				var dir = point_direction(x, y, player_x, player_y - ybuffer);
				var acceleration = 0.4;
				motion_add(dir, acceleration);
				//move_and_collide(lengthdir_x(charge_speed,dir),lengthdir_y(charge_speed,dir));
			}else state = "idle";
		break;
	#endregion
	#region speak
		case "speak":
			set_state_sprite(idle,idle_spd,0);
			text_boss("idle");
		break;
	#endregion
		#region cast
		case "cast":
			set_state_sprite(shot,shot_anim_spd,0);
		
			if timer <= casting_time
			{
				if timer mod 10 == 0
				{
					with instance_create_layer(x,y - 50,"Effects",oMaggie_projectile)
					{
						creator = other;
					}
					
				}
			}else state = "idle";
		break;
	#endregion
}

timer ++;