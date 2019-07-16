//show_debug_message("jelly state : " + string(state));


//every time timer hit the accuracy multiple, the dir in witch jemmy go is update
if timer mod accuracy == 0
{
	player_x = oPlayer.x;
	player_y = oPlayer.y;		
	dir = point_direction(x, y, player_x, player_y - ybuffer);
}	

//orientation of the sprite
var angle = point_direction(x, y, oPlayer.x, oPlayer.y - ybuffer);
image_angle = angle;
		
		
switch state 
{
	case "idle" : 
		set_state_sprite(idle,idle_spd,0);
		state = choose("chase","chase","charge");
		
		if last_state == "charge" && state == "charge"
		{
			state = "chase";
		}
		last_state = state;
		
		if state == "charge"
		{
			// Flash shader value
			flash = 1;
			red = 158;
			green = 0;
			blue = 0;

		}
		
		trace = irandom(3);
		timer = 0;
	
		
		
		if hp <= (max_hp/4)*3 && once1
		{
				
			once1 = false;
				
			hp = (max_hp/4)*3;
			
			accuracy = 50;
			chase_speed = 1.5;
				
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
			
			accuracy = 10;
			chase_speed = 2;
							
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
				repeat 7
				{
					with instance_create_layer(x,y,"Effects",oJelly_trace)
					{
						creator = other;
					}
				}
			}
		}
		
		if timer <= chassing_time
		{
			if x - oPlayer.x > 0 
			{
				image_xscale = 1;
			}else image_xscale = -1;
			var acceleration = 0.25;
			motion_add(dir, acceleration);
			var max_speed = 1;
			if (speed > max_speed) speed = max_speed; 
		}else state = "idle";	
	break;
	case "death":
		death_state(die);
	break;
	
	case "dead":
		dead_state(die);
		if instance_exists(oDoor)
		{
			oDoor.door_status = "open"
		}
	break;
	
	case "knockback":
		knockback_state(sJelly, "stunt");
		alarm[1] = stun_time;
	break;
	#region Charge
		case "charge":
		
			last_state = state;
		
			if timer < charge_time && timer > wait_time
			{
				if x - oPlayer.x > 0 
				{
					image_xscale = 1;
				}else image_xscale = -1;
				var acceleration = 0.25;
				motion_add(dir, acceleration);
				var max_speed = 3;
				if (speed > max_speed) speed = max_speed; 
			}
			if timer > charge_time && timer > wait_time
			{
				state = "idle";
			} 
		break;
	#endregion
	#region speak
		case "speak":
			timer = 0;
			speed = 0;
			set_state_sprite(idle,idle_spd,0);
			text_boss("stunt");
			alarm[1] = stun_time * 3;
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