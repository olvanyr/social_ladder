
if hp <= (max_hp/4)*3 && once1
{
	hp = (max_hp/4)*3;
}

if hp <= (max_hp/4)*1 && once2
{			
	hp = (max_hp/4)*1;
}

show_debug_message("Square state : " + string(state));

switch (state)
{
	#region idle
		case "idle":
		dir = choose(-1,1);
				if form == "square"
				{
					set_state_sprite(idle2,0,0);
					if timer > 180
					{
						state = choose("attack_pierces","recomposing");
						timer = 0;
					}
				}
				if form == "normal"
				{
					set_state_sprite(idle,idle_spd,0);
					if timer > 180
					{
						state = choose("decomposing");
						timer = 0;
					}
				}
			
				
			//image_xscale = - sign(oPlayer.x - x);
			#region speak init
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
			#endregion
		break;
	#endregion
	#region Chase
		case "chase":
		
			set_state_sprite(walk,walk_anim_spd,0);
			
			if timer <= chassing_time
			{
				if place_meeting(x + image_xscale,y,oEnemy_wall)
				{
					image_xscale = -image_xscale;
				}
				var direction_facing = image_xscale;
				move_and_collide(direction_facing * chase_speed,0);
			}else 
			{
				state = "idle";
				timer = 0;
			}
			
		break;
	#endregion
	#region speak
		case "speak":
			set_state_sprite(idle,idle_spd,0);
			text_boss("stun");
			alarm[1] = stun_time * 3;
		break;
	#endregion
	#region Death
		case "death":
			death_state(die);
			if instance_exists(oDoor)
			{
				oDoor.door_status = "open"
			}
		break;
	#endregion
	#region Dead
		case "dead":
			dead_state(die);
		break;
	#endregion
	#region decomposing
		case "decomposing":
			// a normal firstt attack
				set_state_sprite(decomposing,decomposing_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "square";
				}
		break;
		case "recomposing":
			// a normal firstt attack
				set_state_sprite(recomposing,decomposing_anim_spd,0);
				
				if animation_end()
				{
					image_speed = 0;
					state = "idle";
					form = "normal";
				}
		break;
	#endregion
		#region attack pierces
		case "attack_pierces":
			set_state_sprite(attack_pierces,attack_pierces_anim_spd,0);

			
			image_xscale = dir;
			if animation_hit_frame(3)
			{
				
				image_speed = 0
			}
			/* have to check this
			while x < left && dir == -1
			{
				x += dir * pierces_spd;
			}
			
			while x < left && dir == -1
			{
				x += dir * pierces_spd;
			}
			*/
			if animation_end()
			{
				timer = 0;
				state = "idle";
			}
			
		break;
	#endregion
}


timer ++;